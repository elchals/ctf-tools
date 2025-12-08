import argparse
import asyncio
import ssl
from urllib.parse import urlparse

from aioquic.asyncio.client import connect
from aioquic.h3.connection import H3_ALPN
from aioquic.quic.configuration import QuicConfiguration
from aioquic.h3.events import DataReceived, HeadersReceived

from http3_client import HttpClient

async def request(method, url, data, headers, insecure):
    parsed = urlparse(url)
    if parsed.scheme != 'https':
        raise ValueError('Only https URLs are supported')
    config = QuicConfiguration(is_client=True, alpn_protocols=H3_ALPN)
    if insecure:
        config.verify_mode = ssl.CERT_NONE
        config.verify_hostname = False
    host = parsed.hostname
    port = parsed.port or 443

    async with connect(host, port, configuration=config, create_protocol=HttpClient) as client:
        if method == 'GET':
            events = await client.get(url, headers=headers)
        else:
            events = await client.post(url, data=data.encode(), headers=headers)
    body = b''
    status = None
    for event in events:
        if isinstance(event, HeadersReceived):
            hdrs = dict((k.decode(), v.decode()) for k, v in event.headers)
            if ':status' in hdrs:
                status = int(hdrs[':status'])
        elif isinstance(event, DataReceived):
            body += event.data
    return status, body


def main():
    parser = argparse.ArgumentParser(description='Simple HTTP/3 request helper')
    parser.add_argument('method', choices=['GET','POST'])
    parser.add_argument('url')
    parser.add_argument('--data', default='')
    parser.add_argument('--content-type', default='application/json')
    parser.add_argument('--insecure', action='store_true')
    args = parser.parse_args()

    headers = {
        'content-type': args.content_type,
        'content-length': str(len(args.data.encode())) if args.method == 'POST' else '0'
    }
    if args.method == 'GET':
        headers = {}

    status, body = asyncio.run(request(args.method, args.url, args.data, headers, args.insecure))
    print(status)
    if body:
        try:
            print(body.decode())
        except UnicodeDecodeError:
            print(body)

if __name__ == '__main__':
    main()
