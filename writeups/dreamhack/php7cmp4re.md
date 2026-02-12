## Reto: php7cmp4re (PHP 7.4)

### Endpoint correcto

El formulario del index envía el POST a `'/check.php'`, no a `'/'`.

### Payload ganador

- **input1**: `7.:`
- **input2**: `7a`

Ejemplo con `curl`:

```bash
curl -s -X POST \
  --data-urlencode "input1=7.:" \
  --data-urlencode "input2=7a" \
  "http://host3.dreamhack.games:19281/check.php"
```

### Por qué funciona (resumen)

#### `input1`

Se exige `strlen(input1) < 4` y:

- `input1 < "8"`
- `input1 < "7.A"`
- `input1 > "7.9"`

Con `input1 = "7.:"` (3 chars) se fuerza comparación **lexicográfica** (string) porque `"7.:"` **no** es una numeric-string en PHP 7.4:

- `"7.:" < "8"` porque `'7' < '8'`
- `"7.9" < "7.:" < "7.A"` porque `':'` (ASCII 58) está entre `'9'` (57) y `'A'` (65)

#### `input2`

Se exige `strlen(input2) == 2` y:

- `input2 < 74` (comparación contra entero)
- `input2 > "74"` (comparación contra string)

Con `input2 = "7a"`:

- `"7a" < 74` es **numérico**: `"7a"` se castea a `7` → `7 < 74` verdadero
- `"7a" > "74"` es **string** (lexicográfico): `'7' == '7'` y `'a' > '4'` → verdadero

