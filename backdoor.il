.assembly extern mscorlib
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly extern System.Web
{
  .ver 4:0:0:0
  .publickeytoken = (B0 3F 5F 7F 11 D5 0A 3A ) // .?_....:
}
.assembly extern System.Web.Extensions
{
  .ver 4:0:0:0
  .publickeytoken = (31 BF 38 56 AD 36 4E 35 ) // 1.8V.6N5
}
.assembly extern System
{
  .ver 4:0:0:0
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 ) // .z\V.4..
}
.assembly 'backdoor-chall'
{
  .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilationRelaxationsAttribute::'.ctor'(int32) =  (01 00 08 00 00 00 00 00 ) // ........

  .custom instance void class [mscorlib]System.Runtime.CompilerServices.RuntimeCompatibilityAttribute::'.ctor'() =  (
		01 00 01 00 54 02 16 57 72 61 70 4E 6F 6E 45 78   // ....T..WrapNonEx
		63 65 70 74 69 6F 6E 54 68 72 6F 77 73 01       ) // ceptionThrows.

  .custom instance void class [mscorlib]System.Diagnostics.DebuggableAttribute::'.ctor'(valuetype [mscorlib]System.Diagnostics.DebuggableAttribute/DebuggingModes) =  (01 00 02 00 00 00 00 00 ) // ........

  .custom instance void class [mscorlib]System.Reflection.AssemblyTitleAttribute::'.ctor'(string) =  (
		01 00 0E 62 61 63 6B 64 6F 6F 72 5F 63 68 61 6C   // ...backdoor_chal
		6C 00 00                                        ) // l..

  .custom instance void class [mscorlib]System.Reflection.AssemblyDescriptionAttribute::'.ctor'(string) =  (01 00 00 00 00 ) // .....

  .custom instance void class [mscorlib]System.Reflection.AssemblyConfigurationAttribute::'.ctor'(string) =  (01 00 00 00 00 ) // .....

  .custom instance void class [mscorlib]System.Reflection.AssemblyCompanyAttribute::'.ctor'(string) =  (01 00 00 00 00 ) // .....

  .custom instance void class [mscorlib]System.Reflection.AssemblyProductAttribute::'.ctor'(string) =  (
		01 00 0E 62 61 63 6B 64 6F 6F 72 5F 63 68 61 6C   // ...backdoor_chal
		6C 00 00                                        ) // l..

  .custom instance void class [mscorlib]System.Reflection.AssemblyCopyrightAttribute::'.ctor'(string) =  (
		01 00 12 43 6F 70 79 72 69 67 68 74 20 C2 A9 20   // ...Copyright .. 
		20 32 30 32 35 00 00                            ) //  2025..

  .custom instance void class [mscorlib]System.Reflection.AssemblyTrademarkAttribute::'.ctor'(string) =  (01 00 00 00 00 ) // .....

  .custom instance void class [mscorlib]System.Runtime.InteropServices.ComVisibleAttribute::'.ctor'(bool) =  (01 00 00 00 00 ) // .....

  .custom instance void class [mscorlib]System.Runtime.InteropServices.GuidAttribute::'.ctor'(string) =  (
		01 00 24 38 33 37 31 63 61 62 35 2D 35 37 64 36   // ..$8371cab5-57d6
		2D 34 30 38 37 2D 62 63 36 61 2D 37 65 33 35 31   // -4087-bc6a-7e351
		34 63 65 35 32 63 32 00 00                      ) // 4ce52c2..

  .custom instance void class [mscorlib]System.Reflection.AssemblyFileVersionAttribute::'.ctor'(string) =  (01 00 07 31 2E 30 2E 30 2E 30 00 00 ) // ...1.0.0.0..

  .custom instance void class [mscorlib]System.Runtime.Versioning.TargetFrameworkAttribute::'.ctor'(string) =  (
		01 00 1C 2E 4E 45 54 46 72 61 6D 65 77 6F 72 6B   // ....NETFramework
		2C 56 65 72 73 69 6F 6E 3D 76 34 2E 37 2E 32 01   // ,Version=v4.7.2.
		00 54 0E 14 46 72 61 6D 65 77 6F 72 6B 44 69 73   // .T..FrameworkDis
		70 6C 61 79 4E 61 6D 65 14 2E 4E 45 54 20 46 72   // playName..NET Fr
		61 6D 65 77 6F 72 6B 20 34 2E 37 2E 32          ) // amework 4.7.2

  .hash algorithm 0x00008004
  .ver  1:0:0:0
}
.module 'backdoor-chall.dll' // GUID = {C6707E14-2E45-4010-8EED-3861C6CF0639}


  .class private auto ansi sealed beforefieldinit '<>f__AnonymousType0`2'<'<ok>j__TPar','<error>j__TPar'>
  	extends [mscorlib]System.Object
  {
    .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

    .field  private initonly  !0 '<ok>i__Field'
    .custom instance void class [mscorlib]System.Diagnostics.DebuggerBrowsableAttribute::'.ctor'(valuetype [mscorlib]System.Diagnostics.DebuggerBrowsableState) =  (01 00 00 00 00 00 00 00 ) // ........

    .field  private initonly  !1 '<error>i__Field'
    .custom instance void class [mscorlib]System.Diagnostics.DebuggerBrowsableAttribute::'.ctor'(valuetype [mscorlib]System.Diagnostics.DebuggerBrowsableState) =  (01 00 00 00 00 00 00 00 ) // ........


    // method line 1
    .method public hidebysig specialname 
           instance default !'<ok>j__TPar' get_ok ()  cil managed 
    {
        // Method begins at RVA 0x2050
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldfld !0 class '<>f__AnonymousType0`2'<!0,!1>::'<ok>i__Field'
	IL_0006:  ret 
    } // end of method <>f__AnonymousType0`2::get_ok

    // method line 2
    .method public hidebysig specialname 
           instance default !'<error>j__TPar' get_error ()  cil managed 
    {
        // Method begins at RVA 0x2058
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldfld !1 class '<>f__AnonymousType0`2'<!0,!1>::'<error>i__Field'
	IL_0006:  ret 
    } // end of method <>f__AnonymousType0`2::get_error

    // method line 3
    .method public hidebysig specialname rtspecialname 
           instance default void '.ctor' (!'<ok>j__TPar' ok, !'<error>j__TPar' 'error')  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x2060
	// Code size 21 (0x15)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg.1 
	IL_0008:  stfld !0 class '<>f__AnonymousType0`2'<!0,!1>::'<ok>i__Field'
	IL_000d:  ldarg.0 
	IL_000e:  ldarg.2 
	IL_000f:  stfld !1 class '<>f__AnonymousType0`2'<!0,!1>::'<error>i__Field'
	IL_0014:  ret 
    } // end of method <>f__AnonymousType0`2::.ctor

    // method line 4
    .method public virtual hidebysig 
           instance default bool Equals (object 'value')  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x2078
	// Code size 65 (0x41)
	.maxstack 3
	.locals init (
		class '<>f__AnonymousType0`2'<!'<ok>j__TPar', !'<error>j__TPar'>	V_0)
	IL_0000:  ldarg.1 
	IL_0001:  isinst class '<>f__AnonymousType0`2'<!0,!1>
	IL_0006:  stloc.0 
	IL_0007:  ldarg.0 
	IL_0008:  ldloc.0 
	IL_0009:  beq.s IL_003f

	IL_000b:  ldloc.0 
	IL_000c:  brfalse.s IL_003d

	IL_000e:  call class [mscorlib]System.Collections.Generic.EqualityComparer`1<!0> class [mscorlib]System.Collections.Generic.EqualityComparer`1<!'<ok>j__TPar'>::get_Default()
	IL_0013:  ldarg.0 
	IL_0014:  ldfld !0 class '<>f__AnonymousType0`2'<!0,!1>::'<ok>i__Field'
	IL_0019:  ldloc.0 
	IL_001a:  ldfld !0 class '<>f__AnonymousType0`2'<!0,!1>::'<ok>i__Field'
	IL_001f:  callvirt instance bool class [mscorlib]System.Collections.Generic.EqualityComparer`1<!'<ok>j__TPar'>::Equals(!0, !0)
	IL_0024:  brfalse.s IL_003d

	IL_0026:  call class [mscorlib]System.Collections.Generic.EqualityComparer`1<!0> class [mscorlib]System.Collections.Generic.EqualityComparer`1<!'<error>j__TPar'>::get_Default()
	IL_002b:  ldarg.0 
	IL_002c:  ldfld !1 class '<>f__AnonymousType0`2'<!0,!1>::'<error>i__Field'
	IL_0031:  ldloc.0 
	IL_0032:  ldfld !1 class '<>f__AnonymousType0`2'<!0,!1>::'<error>i__Field'
	IL_0037:  callvirt instance bool class [mscorlib]System.Collections.Generic.EqualityComparer`1<!'<error>j__TPar'>::Equals(!0, !0)
	IL_003c:  ret 
	IL_003d:  ldc.i4.0 
	IL_003e:  ret 
	IL_003f:  ldc.i4.1 
	IL_0040:  ret 
    } // end of method <>f__AnonymousType0`2::Equals

    // method line 5
    .method public virtual hidebysig 
           instance default int32 GetHashCode ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x20c5
	// Code size 52 (0x34)
	.maxstack 8
	IL_0000:  ldc.i4 1565954870
	IL_0005:  ldc.i4 -1521134295
	IL_000a:  mul 
	IL_000b:  call class [mscorlib]System.Collections.Generic.EqualityComparer`1<!0> class [mscorlib]System.Collections.Generic.EqualityComparer`1<!'<ok>j__TPar'>::get_Default()
	IL_0010:  ldarg.0 
	IL_0011:  ldfld !0 class '<>f__AnonymousType0`2'<!0,!1>::'<ok>i__Field'
	IL_0016:  callvirt instance int32 class [mscorlib]System.Collections.Generic.EqualityComparer`1<!'<ok>j__TPar'>::GetHashCode(!0)
	IL_001b:  add 
	IL_001c:  ldc.i4 -1521134295
	IL_0021:  mul 
	IL_0022:  call class [mscorlib]System.Collections.Generic.EqualityComparer`1<!0> class [mscorlib]System.Collections.Generic.EqualityComparer`1<!'<error>j__TPar'>::get_Default()
	IL_0027:  ldarg.0 
	IL_0028:  ldfld !1 class '<>f__AnonymousType0`2'<!0,!1>::'<error>i__Field'
	IL_002d:  callvirt instance int32 class [mscorlib]System.Collections.Generic.EqualityComparer`1<!'<error>j__TPar'>::GetHashCode(!0)
	IL_0032:  add 
	IL_0033:  ret 
    } // end of method <>f__AnonymousType0`2::GetHashCode

    // method line 6
    .method public virtual hidebysig 
           instance default string ToString ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x20fc
	// Code size 98 (0x62)
	.maxstack 7
	.locals init (
		!'<ok>j__TPar'	V_0,
		!'<error>j__TPar'	V_1)
	IL_0000:  ldnull 
	IL_0001:  ldstr "{{ ok = {0}, error = {1} }}"
	IL_0006:  ldc.i4.2 
	IL_0007:  newarr [mscorlib]System.Object
	IL_000c:  dup 
	IL_000d:  ldc.i4.0 
	IL_000e:  ldarg.0 
	IL_000f:  ldfld !0 class '<>f__AnonymousType0`2'<!0,!1>::'<ok>i__Field'
	IL_0014:  stloc.0 
	IL_0015:  ldloca.s 0
	IL_0017:  dup 
	IL_0018:  ldobj !0
	IL_001d:  box !0
	IL_0022:  brtrue.s IL_0028

	IL_0024:  pop 
	IL_0025:  ldnull 
	IL_0026:  br.s IL_0033

	IL_0028:  constrained. !0
	IL_002e:  callvirt instance string object::ToString()
	IL_0033:  stelem.ref 
	IL_0034:  dup 
	IL_0035:  ldc.i4.1 
	IL_0036:  ldarg.0 
	IL_0037:  ldfld !1 class '<>f__AnonymousType0`2'<!0,!1>::'<error>i__Field'
	IL_003c:  stloc.1 
	IL_003d:  ldloca.s 1
	IL_003f:  dup 
	IL_0040:  ldobj !1
	IL_0045:  box !1
	IL_004a:  brtrue.s IL_0050

	IL_004c:  pop 
	IL_004d:  ldnull 
	IL_004e:  br.s IL_005b

	IL_0050:  constrained. !1
	IL_0056:  callvirt instance string object::ToString()
	IL_005b:  stelem.ref 
	IL_005c:  call string string::Format(class [mscorlib]System.IFormatProvider, string, object[])
	IL_0061:  ret 
    } // end of method <>f__AnonymousType0`2::ToString

	.property instance !'<ok>j__TPar' ok ()
	{
		.get instance default !(null) '<>f__AnonymousType0`2'::get_ok () 
	}
	.property instance !'<error>j__TPar' 'error' ()
	{
		.get instance default !(null) '<>f__AnonymousType0`2'::get_error () 
	}
  } // end of class <>f__AnonymousType0`2

.namespace AuthPages
{
  .class public auto ansi beforefieldinit LoginPage
  	extends [System.Web]System.Web.UI.Page
  {
    .field  family  class [System.Web]System.Web.UI.HtmlControls.HtmlForm form1
    .field  family  class [System.Web]System.Web.UI.WebControls.TextBox PasswordBox
    .field  family  class [System.Web]System.Web.UI.WebControls.Button LoginBtn
    .field  family  class [System.Web]System.Web.UI.WebControls.Literal Message

    // method line 7
    .method family hidebysig 
           instance default void Page_Load (object sender, class [mscorlib]System.EventArgs e)  cil managed 
    {
        // Method begins at RVA 0x216a
	// Code size 1 (0x1)
	.maxstack 8
	IL_0000:  ret 
    } // end of method LoginPage::Page_Load

    // method line 8
    .method family hidebysig 
           instance default void LoginBtn_Click (object sender, class [mscorlib]System.EventArgs e)  cil managed 
    {
        // Method begins at RVA 0x216c
	// Code size 95 (0x5f)
	.maxstack 2
	.locals init (
		string	V_0,
		string	V_1)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class [System.Web]System.Web.UI.WebControls.TextBox AuthPages.LoginPage::PasswordBox
	IL_0006:  callvirt instance string class [System.Web]System.Web.UI.WebControls.TextBox::get_Text()
	IL_000b:  dup 
	IL_000c:  brtrue.s IL_0014

	IL_000e:  pop 
	IL_000f:  ldstr ""
	IL_0014:  stloc.0 
	IL_0015:  ldstr "ADMIN_PASS"
	IL_001a:  call string class [mscorlib]System.Environment::GetEnvironmentVariable(string)
	IL_001f:  dup 
	IL_0020:  brtrue.s IL_0028

	IL_0022:  pop 
	IL_0023:  ldstr "letmein"
	IL_0028:  stloc.1 
	IL_0029:  ldloc.0 
	IL_002a:  ldloc.1 
	IL_002b:  call bool string::op_Equality(string, string)
	IL_0030:  brfalse.s IL_004e

	IL_0032:  ldstr "admin"
	IL_0037:  ldc.i4.0 
	IL_0038:  call void class [System.Web]System.Web.Security.FormsAuthentication::SetAuthCookie(string, bool)
	IL_003d:  ldarg.0 
	IL_003e:  call instance class [System.Web]System.Web.HttpResponse class [System.Web]System.Web.UI.Page::get_Response()
	IL_0043:  ldstr "~/admin.aspx"
	IL_0048:  callvirt instance void class [System.Web]System.Web.HttpResponse::Redirect(string)
	IL_004d:  ret 
	IL_004e:  ldarg.0 
	IL_004f:  ldfld class [System.Web]System.Web.UI.WebControls.Literal AuthPages.LoginPage::Message
	IL_0054:  ldstr "Bad password"
	IL_0059:  callvirt instance void class [System.Web]System.Web.UI.WebControls.Literal::set_Text(string)
	IL_005e:  ret 
    } // end of method LoginPage::LoginBtn_Click

    // method line 9
    .method public hidebysig specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x21d7
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class [System.Web]System.Web.UI.Page::'.ctor'()
	IL_0006:  ret 
    } // end of method LoginPage::.ctor

  } // end of class AuthPages.LoginPage
}

.namespace backdoor_chall
{
  .class public auto ansi beforefieldinit Global
  	extends [System.Web]System.Web.HttpApplication
  {

    // method line 10
    .method family hidebysig 
           instance default void Application_Start (object sender, class [mscorlib]System.EventArgs e)  cil managed 
    {
        // Method begins at RVA 0x216a
	// Code size 1 (0x1)
	.maxstack 8
	IL_0000:  ret 
    } // end of method Global::Application_Start

    // method line 11
    .method family hidebysig 
           instance default void Session_Start (object sender, class [mscorlib]System.EventArgs e)  cil managed 
    {
        // Method begins at RVA 0x216a
	// Code size 1 (0x1)
	.maxstack 8
	IL_0000:  ret 
    } // end of method Global::Session_Start

    // method line 12
    .method family hidebysig 
           instance default void Application_BeginRequest (object sender, class [mscorlib]System.EventArgs e)  cil managed 
    {
        // Method begins at RVA 0x216a
	// Code size 1 (0x1)
	.maxstack 8
	IL_0000:  ret 
    } // end of method Global::Application_BeginRequest

    // method line 13
    .method family hidebysig 
           instance default void Application_AuthenticateRequest (object sender, class [mscorlib]System.EventArgs e)  cil managed 
    {
        // Method begins at RVA 0x216a
	// Code size 1 (0x1)
	.maxstack 8
	IL_0000:  ret 
    } // end of method Global::Application_AuthenticateRequest

    // method line 14
    .method family hidebysig 
           instance default void Application_Error (object sender, class [mscorlib]System.EventArgs e)  cil managed 
    {
        // Method begins at RVA 0x216a
	// Code size 1 (0x1)
	.maxstack 8
	IL_0000:  ret 
    } // end of method Global::Application_Error

    // method line 15
    .method family hidebysig 
           instance default void Session_End (object sender, class [mscorlib]System.EventArgs e)  cil managed 
    {
        // Method begins at RVA 0x216a
	// Code size 1 (0x1)
	.maxstack 8
	IL_0000:  ret 
    } // end of method Global::Session_End

    // method line 16
    .method family hidebysig 
           instance default void Application_End (object sender, class [mscorlib]System.EventArgs e)  cil managed 
    {
        // Method begins at RVA 0x216a
	// Code size 1 (0x1)
	.maxstack 8
	IL_0000:  ret 
    } // end of method Global::Application_End

    // method line 17
    .method public hidebysig specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x21df
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class [System.Web]System.Web.HttpApplication::'.ctor'()
	IL_0006:  ret 
    } // end of method Global::.ctor

  } // end of class backdoor_chall.Global
}

.namespace Health.Handlers
{
  .class public auto ansi beforefieldinit HeaderPair
  	extends [mscorlib]System.Object
  {
    .field  private  string '<name>k__BackingField'
    .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

    .field  private  string '<value>k__BackingField'
    .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....


    // method line 18
    .method public hidebysig specialname 
           instance default string get_name ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x21e7
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldfld string Health.Handlers.HeaderPair::'<name>k__BackingField'
	IL_0006:  ret 
    } // end of method HeaderPair::get_name

    // method line 19
    .method public hidebysig specialname 
           instance default void set_name (string 'value')  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x21ef
	// Code size 8 (0x8)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldarg.1 
	IL_0002:  stfld string Health.Handlers.HeaderPair::'<name>k__BackingField'
	IL_0007:  ret 
    } // end of method HeaderPair::set_name

    // method line 20
    .method public hidebysig specialname 
           instance default string get_value ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x21f8
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldfld string Health.Handlers.HeaderPair::'<value>k__BackingField'
	IL_0006:  ret 
    } // end of method HeaderPair::get_value

    // method line 21
    .method public hidebysig specialname 
           instance default void set_value (string 'value')  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x2200
	// Code size 8 (0x8)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldarg.1 
	IL_0002:  stfld string Health.Handlers.HeaderPair::'<value>k__BackingField'
	IL_0007:  ret 
    } // end of method HeaderPair::set_value

    // method line 22
    .method public hidebysig specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2209
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method HeaderPair::.ctor

    // method line 23
    .method public hidebysig specialname rtspecialname 
           instance default void '.ctor' (string n, string v)  cil managed 
    {
        // Method begins at RVA 0x2211
	// Code size 21 (0x15)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg.1 
	IL_0008:  call instance void class Health.Handlers.HeaderPair::set_name(string)
	IL_000d:  ldarg.0 
	IL_000e:  ldarg.2 
	IL_000f:  call instance void class Health.Handlers.HeaderPair::set_value(string)
	IL_0014:  ret 
    } // end of method HeaderPair::.ctor

	.property instance string name ()
	{
		.get instance default string Health.Handlers.HeaderPair::get_name () 
		.set instance default void Health.Handlers.HeaderPair::set_name (string 'value') 
	}
	.property instance string 'value' ()
	{
		.get instance default string Health.Handlers.HeaderPair::get_value () 
		.set instance default void Health.Handlers.HeaderPair::set_value (string 'value') 
	}
  } // end of class Health.Handlers.HeaderPair
}

.namespace Health.Handlers
{
  .class public auto ansi beforefieldinit HealthcheckResponse
  	extends [mscorlib]System.Object
  {
    .field  private  bool '<ok>k__BackingField'
    .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

    .field  private  int32 '<statusCode>k__BackingField'
    .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

    .field  private  class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair> '<headers>k__BackingField'
    .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

    .field  private  string '<snippet>k__BackingField'
    .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

    .field  private  string '<error>k__BackingField'
    .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....


    // method line 24
    .method public hidebysig specialname 
           instance default bool get_ok ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x2227
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldfld bool Health.Handlers.HealthcheckResponse::'<ok>k__BackingField'
	IL_0006:  ret 
    } // end of method HealthcheckResponse::get_ok

    // method line 25
    .method public hidebysig specialname 
           instance default void set_ok (bool 'value')  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x222f
	// Code size 8 (0x8)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldarg.1 
	IL_0002:  stfld bool Health.Handlers.HealthcheckResponse::'<ok>k__BackingField'
	IL_0007:  ret 
    } // end of method HealthcheckResponse::set_ok

    // method line 26
    .method public hidebysig specialname 
           instance default int32 get_statusCode ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x2238
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldfld int32 Health.Handlers.HealthcheckResponse::'<statusCode>k__BackingField'
	IL_0006:  ret 
    } // end of method HealthcheckResponse::get_statusCode

    // method line 27
    .method public hidebysig specialname 
           instance default void set_statusCode (int32 'value')  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x2240
	// Code size 8 (0x8)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldarg.1 
	IL_0002:  stfld int32 Health.Handlers.HealthcheckResponse::'<statusCode>k__BackingField'
	IL_0007:  ret 
    } // end of method HealthcheckResponse::set_statusCode

    // method line 28
    .method public hidebysig specialname 
           instance default class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair> get_headers ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x2249
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair> Health.Handlers.HealthcheckResponse::'<headers>k__BackingField'
	IL_0006:  ret 
    } // end of method HealthcheckResponse::get_headers

    // method line 29
    .method public hidebysig specialname 
           instance default void set_headers (class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair> 'value')  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x2251
	// Code size 8 (0x8)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldarg.1 
	IL_0002:  stfld class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair> Health.Handlers.HealthcheckResponse::'<headers>k__BackingField'
	IL_0007:  ret 
    } // end of method HealthcheckResponse::set_headers

    // method line 30
    .method public hidebysig specialname 
           instance default string get_snippet ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x225a
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldfld string Health.Handlers.HealthcheckResponse::'<snippet>k__BackingField'
	IL_0006:  ret 
    } // end of method HealthcheckResponse::get_snippet

    // method line 31
    .method public hidebysig specialname 
           instance default void set_snippet (string 'value')  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x2262
	// Code size 8 (0x8)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldarg.1 
	IL_0002:  stfld string Health.Handlers.HealthcheckResponse::'<snippet>k__BackingField'
	IL_0007:  ret 
    } // end of method HealthcheckResponse::set_snippet

    // method line 32
    .method public hidebysig specialname 
           instance default string get_error ()  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x226b
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldfld string Health.Handlers.HealthcheckResponse::'<error>k__BackingField'
	IL_0006:  ret 
    } // end of method HealthcheckResponse::get_error

    // method line 33
    .method public hidebysig specialname 
           instance default void set_error (string 'value')  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x2273
	// Code size 8 (0x8)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldarg.1 
	IL_0002:  stfld string Health.Handlers.HealthcheckResponse::'<error>k__BackingField'
	IL_0007:  ret 
    } // end of method HealthcheckResponse::set_error

    // method line 34
    .method public hidebysig specialname rtspecialname 
           instance default void '.ctor' (bool ok, int32 statusCode, class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair> headers, string snippet, [opt] string 'error')  cil managed 
    {
	.param [5] = nullref
        // Method begins at RVA 0x227c
	// Code size 53 (0x35)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ldarg.0 
	IL_0007:  ldarg.1 
	IL_0008:  call instance void class Health.Handlers.HealthcheckResponse::set_ok(bool)
	IL_000d:  ldarg.0 
	IL_000e:  ldarg.2 
	IL_000f:  call instance void class Health.Handlers.HealthcheckResponse::set_statusCode(int32)
	IL_0014:  ldarg.0 
	IL_0015:  ldarg.3 
	IL_0016:  dup 
	IL_0017:  brtrue.s IL_001f

	IL_0019:  pop 
	IL_001a:  newobj instance void class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair>::'.ctor'()
	IL_001f:  call instance void class Health.Handlers.HealthcheckResponse::set_headers(class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair>)
	IL_0024:  ldarg.0 
	IL_0025:  ldarg.s 4
	IL_0027:  call instance void class Health.Handlers.HealthcheckResponse::set_snippet(string)
	IL_002c:  ldarg.0 
	IL_002d:  ldarg.s 5
	IL_002f:  call instance void class Health.Handlers.HealthcheckResponse::set_error(string)
	IL_0034:  ret 
    } // end of method HealthcheckResponse::.ctor

	.property instance bool ok ()
	{
		.get instance default bool Health.Handlers.HealthcheckResponse::get_ok () 
		.set instance default void Health.Handlers.HealthcheckResponse::set_ok (bool 'value') 
	}
	.property instance int32 statusCode ()
	{
		.get instance default int32 Health.Handlers.HealthcheckResponse::get_statusCode () 
		.set instance default void Health.Handlers.HealthcheckResponse::set_statusCode (int32 'value') 
	}
	.property instance class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair> headers ()
	{
		.get instance default class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair> Health.Handlers.HealthcheckResponse::get_headers () 
		.set instance default void Health.Handlers.HealthcheckResponse::set_headers (class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair> 'value') 
	}
	.property instance string snippet ()
	{
		.get instance default string Health.Handlers.HealthcheckResponse::get_snippet () 
		.set instance default void Health.Handlers.HealthcheckResponse::set_snippet (string 'value') 
	}
	.property instance string 'error' ()
	{
		.get instance default string Health.Handlers.HealthcheckResponse::get_error () 
		.set instance default void Health.Handlers.HealthcheckResponse::set_error (string 'value') 
	}
  } // end of class Health.Handlers.HealthcheckResponse
}

.namespace Health.Handlers
{
  .class public auto ansi beforefieldinit HealthHandler
  	extends [mscorlib]System.Object
  	implements [System.Web]System.Web.IHttpAsyncHandler, [System.Web]System.Web.IHttpHandler, [System.Web]System.Web.SessionState.IRequiresSessionState  {

    // method line 35
    .method public final virtual hidebysig newslot specialname 
           instance default bool get_IsReusable ()  cil managed 
    {
        // Method begins at RVA 0x22b2
	// Code size 2 (0x2)
	.maxstack 8
	IL_0000:  ldc.i4.0 
	IL_0001:  ret 
    } // end of method HealthHandler::get_IsReusable

    // method line 36
    .method public final virtual hidebysig newslot 
           instance default class [mscorlib]System.IAsyncResult BeginProcessRequest (class [System.Web]System.Web.HttpContext context, class [mscorlib]System.AsyncCallback cb, object extraData)  cil managed 
    {
        // Method begins at RVA 0x22b8
	// Code size 65 (0x41)
	.maxstack 3
	.locals init (
		class Health.Handlers.HealthHandler/'<>c__DisplayClass2_0'	V_0)
	IL_0000:  newobj instance void class Health.Handlers.HealthHandler/'<>c__DisplayClass2_0'::'.ctor'()
	IL_0005:  stloc.0 
	IL_0006:  ldloc.0 
	IL_0007:  ldarg.2 
	IL_0008:  stfld class [mscorlib]System.AsyncCallback Health.Handlers.HealthHandler/'<>c__DisplayClass2_0'::cb
	IL_000d:  ldloc.0 
	IL_000e:  ldarg.0 
	IL_000f:  ldarg.1 
	IL_0010:  call instance class [mscorlib]System.Threading.Tasks.Task class Health.Handlers.HealthHandler::ProcessRequestAsync(class [System.Web]System.Web.HttpContext)
	IL_0015:  stfld class [mscorlib]System.Threading.Tasks.Task Health.Handlers.HealthHandler/'<>c__DisplayClass2_0'::task
	IL_001a:  ldloc.0 
	IL_001b:  ldfld class [mscorlib]System.AsyncCallback Health.Handlers.HealthHandler/'<>c__DisplayClass2_0'::cb
	IL_0020:  brfalse.s IL_003a

	IL_0022:  ldloc.0 
	IL_0023:  ldfld class [mscorlib]System.Threading.Tasks.Task Health.Handlers.HealthHandler/'<>c__DisplayClass2_0'::task
	IL_0028:  ldloc.0 
	IL_0029:  ldftn instance void class Health.Handlers.HealthHandler/'<>c__DisplayClass2_0'::'<BeginProcessRequest>b__0'(class [mscorlib]System.Threading.Tasks.Task)
	IL_002f:  newobj instance void class [mscorlib]System.Action`1<class [mscorlib]System.Threading.Tasks.Task>::'.ctor'(object, native int)
	IL_0034:  callvirt instance class [mscorlib]System.Threading.Tasks.Task class [mscorlib]System.Threading.Tasks.Task::ContinueWith(class [mscorlib]System.Action`1<class [mscorlib]System.Threading.Tasks.Task>)
	IL_0039:  pop 
	IL_003a:  ldloc.0 
	IL_003b:  ldfld class [mscorlib]System.Threading.Tasks.Task Health.Handlers.HealthHandler/'<>c__DisplayClass2_0'::task
	IL_0040:  ret 
    } // end of method HealthHandler::BeginProcessRequest

    // method line 37
    .method public final virtual hidebysig newslot 
           instance default void EndProcessRequest (class [mscorlib]System.IAsyncResult result)  cil managed 
    {
        // Method begins at RVA 0x2305
	// Code size 17 (0x11)
	.maxstack 8
	IL_0000:  ldarg.1 
	IL_0001:  isinst [mscorlib]System.Threading.Tasks.Task
	IL_0006:  dup 
	IL_0007:  brtrue.s IL_000b

	IL_0009:  pop 
	IL_000a:  ret 
	IL_000b:  call instance void class [mscorlib]System.Threading.Tasks.Task::Wait()
	IL_0010:  ret 
    } // end of method HealthHandler::EndProcessRequest

    // method line 38
    .method public hidebysig 
           instance default class [mscorlib]System.Threading.Tasks.Task ProcessRequestAsync (class [System.Web]System.Web.HttpContext context)  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.AsyncStateMachineAttribute::'.ctor'(class [mscorlib]System.Type) =  (
		01 00 37 48 65 61 6C 74 68 2E 48 61 6E 64 6C 65   // ..7Health.Handle
		72 73 2E 48 65 61 6C 74 68 48 61 6E 64 6C 65 72   // rs.HealthHandler
		2B 3C 50 72 6F 63 65 73 73 52 65 71 75 65 73 74   // +<ProcessRequest
		41 73 79 6E 63 3E 64 5F 5F 34 00 00             ) // Async>d__4..

        // Method begins at RVA 0x2318
	// Code size 63 (0x3f)
	.maxstack 2
	.locals init (
		valuetype Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'	V_0)
	IL_0000:  ldloca.s 0
	IL_0002:  call valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::Create()
	IL_0007:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>t__builder'
	IL_000c:  ldloca.s 0
	IL_000e:  ldarg.0 
	IL_000f:  stfld class Health.Handlers.HealthHandler Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>4__this'
	IL_0014:  ldloca.s 0
	IL_0016:  ldarg.1 
	IL_0017:  stfld class [System.Web]System.Web.HttpContext Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::context
	IL_001c:  ldloca.s 0
	IL_001e:  ldc.i4.m1 
	IL_001f:  stfld int32 Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>1__state'
	IL_0024:  ldloca.s 0
	IL_0026:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>t__builder'
	IL_002b:  ldloca.s 0
	IL_002d:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::Start<valuetype Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'> ([out] !!0&)
	IL_0032:  ldloca.s 0
	IL_0034:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>t__builder'
	IL_0039:  call instance class [mscorlib]System.Threading.Tasks.Task valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::get_Task()
	IL_003e:  ret 
    } // end of method HealthHandler::ProcessRequestAsync

    // method line 39
    .method private hidebysig 
           instance default void WriteJson (class [System.Web]System.Web.HttpContext ctx, object obj)  cil managed 
    {
        // Method begins at RVA 0x2364
	// Code size 25 (0x19)
	.maxstack 3
	.locals init (
		class [System.Web.Extensions]System.Web.Script.Serialization.JavaScriptSerializer	V_0)
	IL_0000:  newobj instance void class [System.Web.Extensions]System.Web.Script.Serialization.JavaScriptSerializer::'.ctor'()
	IL_0005:  stloc.0 
	IL_0006:  ldarg.1 
	IL_0007:  callvirt instance class [System.Web]System.Web.HttpResponse class [System.Web]System.Web.HttpContext::get_Response()
	IL_000c:  ldloc.0 
	IL_000d:  ldarg.2 
	IL_000e:  callvirt instance string class [System.Web.Extensions]System.Web.Script.Serialization.JavaScriptSerializer::Serialize(object)
	IL_0013:  callvirt instance void class [System.Web]System.Web.HttpResponse::Write(string)
	IL_0018:  ret 
    } // end of method HealthHandler::WriteJson

    // method line 40
    .method private hidebysig 
           instance default class [mscorlib]System.Threading.Tasks.Task`1<bool> TaskWhenAnyWithTimeout (class [mscorlib]System.Threading.Tasks.Task t, valuetype [mscorlib]System.TimeSpan timeout)  cil managed 
    {
        .custom instance void class [mscorlib]System.Runtime.CompilerServices.AsyncStateMachineAttribute::'.ctor'(class [mscorlib]System.Type) =  (
		01 00 3A 48 65 61 6C 74 68 2E 48 61 6E 64 6C 65   // ..:Health.Handle
		72 73 2E 48 65 61 6C 74 68 48 61 6E 64 6C 65 72   // rs.HealthHandler
		2B 3C 54 61 73 6B 57 68 65 6E 41 6E 79 57 69 74   // +<TaskWhenAnyWit
		68 54 69 6D 65 6F 75 74 3E 64 5F 5F 36 00 00    ) // hTimeout>d__6..

        // Method begins at RVA 0x238c
	// Code size 63 (0x3f)
	.maxstack 2
	.locals init (
		valuetype Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'	V_0)
	IL_0000:  ldloca.s 0
	IL_0002:  call valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<!0> valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<bool>::Create()
	IL_0007:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<bool> Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'::'<>t__builder'
	IL_000c:  ldloca.s 0
	IL_000e:  ldarg.1 
	IL_000f:  stfld class [mscorlib]System.Threading.Tasks.Task Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'::t
	IL_0014:  ldloca.s 0
	IL_0016:  ldarg.2 
	IL_0017:  stfld valuetype [mscorlib]System.TimeSpan Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'::timeout
	IL_001c:  ldloca.s 0
	IL_001e:  ldc.i4.m1 
	IL_001f:  stfld int32 Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'::'<>1__state'
	IL_0024:  ldloca.s 0
	IL_0026:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<bool> Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'::'<>t__builder'
	IL_002b:  ldloca.s 0
	IL_002d:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<bool>::Start<valuetype Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'> ([out] !!0&)
	IL_0032:  ldloca.s 0
	IL_0034:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<bool> Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'::'<>t__builder'
	IL_0039:  call instance class [mscorlib]System.Threading.Tasks.Task`1<!0> valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<bool>::get_Task()
	IL_003e:  ret 
    } // end of method HealthHandler::TaskWhenAnyWithTimeout

    // method line 41
    .method public final virtual hidebysig newslot 
           instance default void ProcessRequest (class [System.Web]System.Web.HttpContext context)  cil managed 
    {
        // Method begins at RVA 0x23d7
	// Code size 6 (0x6)
	.maxstack 8
	IL_0000:  newobj instance void class [mscorlib]System.NotImplementedException::'.ctor'()
	IL_0005:  throw 
    } // end of method HealthHandler::ProcessRequest

    // method line 42
    .method public hidebysig specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2209
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method HealthHandler::.ctor

	.property instance bool IsReusable ()
	{
		.get instance default bool Health.Handlers.HealthHandler::get_IsReusable () 
	}
  .class nested private auto ansi sealed beforefieldinit '<>c__DisplayClass2_0'
  	extends [mscorlib]System.Object
  {
    .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

    .field  public  class [mscorlib]System.AsyncCallback cb
    .field  public  class [mscorlib]System.Threading.Tasks.Task task

    // method line 45
    .method public hidebysig specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x2209
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  call instance void object::'.ctor'()
	IL_0006:  ret 
    } // end of method <>c__DisplayClass2_0::.ctor

    // method line 46
    .method assembly hidebysig 
           instance default void '<BeginProcessRequest>b__0' (class [mscorlib]System.Threading.Tasks.Task _)  cil managed 
    {
        // Method begins at RVA 0x249e
	// Code size 18 (0x12)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldfld class [mscorlib]System.AsyncCallback Health.Handlers.HealthHandler/'<>c__DisplayClass2_0'::cb
	IL_0006:  ldarg.0 
	IL_0007:  ldfld class [mscorlib]System.Threading.Tasks.Task Health.Handlers.HealthHandler/'<>c__DisplayClass2_0'::task
	IL_000c:  callvirt instance void class [mscorlib]System.AsyncCallback::Invoke(class [mscorlib]System.IAsyncResult)
	IL_0011:  ret 
    } // end of method <>c__DisplayClass2_0::<BeginProcessRequest>b__0

  } // end of class <>c__DisplayClass2_0

  .class nested private auto ansi sealed beforefieldinit '<ProcessRequestAsync>d__4'
  	extends [mscorlib]System.ValueType
  	implements [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine  {
    .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

    .field  public  int32 '<>1__state'
    .field  public  valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder '<>t__builder'
    .field  public  class [System.Web]System.Web.HttpContext context
    .field  public  class Health.Handlers.HealthHandler '<>4__this'
    .field  private  class [mscorlib]System.IO.StreamReader '<sr>5__2'
    .field  private  valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<string> '<>u__1'
    .field  private  class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair> '<headers>5__3'
    .field  private  class [System]System.Net.WebClient '<client>5__4'
    .field  private  class [mscorlib]System.Threading.Tasks.Task`1<string> '<downloadTask>5__5'
    .field  private  valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<bool> '<>u__2'

    // method line 47
    .method private final virtual hidebysig newslot 
           instance default void MoveNext ()  cil managed 
    {
        // Method begins at RVA 0x24b4
	.override class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine::MoveNext
	// Code size 1569 (0x621)
	.maxstack 7
	.locals init (
		int32	V_0,
		class Health.Handlers.HealthHandler	V_1,
		string	V_2,
		string	V_3,
		string	V_4,
		string	V_5,
		string	V_6,
		class [System]System.Uri	V_7,
		valuetype [mscorlib]System.TimeSpan	V_8,
		string	V_9,
		valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<string>	V_10,
		class [System.Web.Extensions]System.Web.Script.Serialization.JavaScriptSerializer	V_11,
		class [mscorlib]System.Collections.Generic.Dictionary`2<string, object>	V_12,
		string	V_13,
		string	V_14,
		bool	V_15,
		class [System]System.Net.WebHeaderCollection	V_16,
		bool	V_17,
		valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<bool>	V_18,
		string	V_19,
		valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<string>	V_20,
		string[]	V_21,
		int32	V_22,
		string	V_23,
		string	V_24,
		class [mscorlib]System.TimeoutException	V_25,
		class [System]System.Net.WebException	V_26,
		class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair>	V_27,
		int32	V_28,
		class [System]System.Net.HttpWebResponse	V_29,
		string[]	V_30,
		int32	V_31,
		string	V_32,
		string	V_33,
		class [mscorlib]System.Exception	V_34,
		class [mscorlib]System.Exception	V_35)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld int32 Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>1__state'
	IL_0006:  stloc.0 
	IL_0007:  ldarg.0 
	IL_0008:  ldfld class Health.Handlers.HealthHandler Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>4__this'
	IL_000d:  stloc.1 
	.try { // 7
	  IL_000e:  ldloc.0 
	  IL_000f:  brfalse IL_012b

	  IL_0014:  ldloc.0 
	  IL_0015:  ldc.i4.1 
	  IL_0016:  sub 
	  IL_0017:  ldc.i4.1 
	  IL_0018:  ble.un IL_0255

	  IL_001d:  ldarg.0 
	  IL_001e:  ldfld class [System.Web]System.Web.HttpContext Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::context
	  IL_0023:  callvirt instance class [System.Web]System.Web.HttpResponse class [System.Web]System.Web.HttpContext::get_Response()
	  IL_0028:  ldstr "application/json"
	  IL_002d:  callvirt instance void class [System.Web]System.Web.HttpResponse::set_ContentType(string)
	  IL_0032:  ldarg.0 
	  IL_0033:  ldfld class [System.Web]System.Web.HttpContext Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::context
	  IL_0038:  callvirt instance class [System.Web]System.Web.HttpRequest class [System.Web]System.Web.HttpContext::get_Request()
	  IL_003d:  callvirt instance class [System.Web]System.Web.HttpCookieCollection class [System.Web]System.Web.HttpRequest::get_Cookies()
	  IL_0042:  ldstr "__AntiXsrfToken"
	  IL_0047:  callvirt instance class [System.Web]System.Web.HttpCookie class [System.Web]System.Web.HttpCookieCollection::get_Item(string)
	  IL_004c:  dup 
	  IL_004d:  brtrue.s IL_0053

	  IL_004f:  pop 
	  IL_0050:  ldnull 
	  IL_0051:  br.s IL_0058

	  IL_0053:  call instance string class [System.Web]System.Web.HttpCookie::get_Value()
	  IL_0058:  stloc.2 
	  IL_0059:  ldarg.0 
	  IL_005a:  ldfld class [System.Web]System.Web.HttpContext Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::context
	  IL_005f:  callvirt instance class [System.Web]System.Web.HttpRequest class [System.Web]System.Web.HttpContext::get_Request()
	  IL_0064:  callvirt instance class [System]System.Collections.Specialized.NameValueCollection class [System.Web]System.Web.HttpRequest::get_Headers()
	  IL_0069:  ldstr "X-AntiXsrf"
	  IL_006e:  callvirt instance string class [System]System.Collections.Specialized.NameValueCollection::get_Item(string)
	  IL_0073:  stloc.3 
	  IL_0074:  ldarg.0 
	  IL_0075:  ldfld class [System.Web]System.Web.HttpContext Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::context
	  IL_007a:  callvirt instance class [System.Web]System.Web.SessionState.HttpSessionState class [System.Web]System.Web.HttpContext::get_Session()
	  IL_007f:  ldstr "ANTI_XSRF"
	  IL_0084:  callvirt instance object class [System.Web]System.Web.SessionState.HttpSessionState::get_Item(string)
	  IL_0089:  isinst [mscorlib]System.String
	  IL_008e:  stloc.s 4
	  IL_0090:  ldloc.2 
	  IL_0091:  call bool string::IsNullOrEmpty(string)
	  IL_0096:  brtrue.s IL_00bc

	  IL_0098:  ldloc.3 
	  IL_0099:  call bool string::IsNullOrEmpty(string)
	  IL_009e:  brtrue.s IL_00bc

	  IL_00a0:  ldloc.s 4
	  IL_00a2:  call bool string::IsNullOrEmpty(string)
	  IL_00a7:  brtrue.s IL_00bc

	  IL_00a9:  ldloc.2 
	  IL_00aa:  ldloc.3 
	  IL_00ab:  call bool string::op_Inequality(string, string)
	  IL_00b0:  brtrue.s IL_00bc

	  IL_00b2:  ldloc.s 4
	  IL_00b4:  ldloc.2 
	  IL_00b5:  call bool string::op_Inequality(string, string)
	  IL_00ba:  brfalse.s IL_0100

	  IL_00bc:  ldarg.0 
	  IL_00bd:  ldfld class [System.Web]System.Web.HttpContext Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::context
	  IL_00c2:  callvirt instance class [System.Web]System.Web.HttpResponse class [System.Web]System.Web.HttpContext::get_Response()
	  IL_00c7:  ldc.i4 403
	  IL_00cc:  callvirt instance void class [System.Web]System.Web.HttpResponse::set_StatusCode(int32)
	  IL_00d1:  ldarg.0 
	  IL_00d2:  ldfld class [System.Web]System.Web.HttpContext Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::context
	  IL_00d7:  callvirt instance class [System.Web]System.Web.HttpResponse class [System.Web]System.Web.HttpContext::get_Response()
	  IL_00dc:  ldstr "text/plain"
	  IL_00e1:  callvirt instance void class [System.Web]System.Web.HttpResponse::set_ContentType(string)
	  IL_00e6:  ldarg.0 
	  IL_00e7:  ldfld class [System.Web]System.Web.HttpContext Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::context
	  IL_00ec:  callvirt instance class [System.Web]System.Web.HttpResponse class [System.Web]System.Web.HttpContext::get_Response()
	  IL_00f1:  ldstr "Anti-XSRF validation failed"
	  IL_00f6:  callvirt instance void class [System.Web]System.Web.HttpResponse::Write(string)
	  IL_00fb:  leave IL_060d

	  IL_0100:  ldarg.0 
	  IL_0101:  ldarg.0 
	  IL_0102:  ldfld class [System.Web]System.Web.HttpContext Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::context
	  IL_0107:  callvirt instance class [System.Web]System.Web.HttpRequest class [System.Web]System.Web.HttpContext::get_Request()
	  IL_010c:  callvirt instance class [mscorlib]System.IO.Stream class [System.Web]System.Web.HttpRequest::get_InputStream()
	  IL_0111:  ldarg.0 
	  IL_0112:  ldfld class [System.Web]System.Web.HttpContext Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::context
	  IL_0117:  callvirt instance class [System.Web]System.Web.HttpRequest class [System.Web]System.Web.HttpContext::get_Request()
	  IL_011c:  callvirt instance class [mscorlib]System.Text.Encoding class [System.Web]System.Web.HttpRequest::get_ContentEncoding()
	  IL_0121:  newobj instance void class [mscorlib]System.IO.StreamReader::'.ctor'(class [mscorlib]System.IO.Stream, class [mscorlib]System.Text.Encoding)
	  IL_0126:  stfld class [mscorlib]System.IO.StreamReader Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<sr>5__2'
	  IL_012b:  nop 
	  .try { // 0
	    IL_012c:  ldloc.0 
	    IL_012d:  brfalse.s IL_016e

	    IL_012f:  ldarg.0 
	    IL_0130:  ldfld class [mscorlib]System.IO.StreamReader Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<sr>5__2'
	    IL_0135:  callvirt instance class [mscorlib]System.Threading.Tasks.Task`1<string> class [mscorlib]System.IO.TextReader::ReadToEndAsync()
	    IL_013a:  callvirt instance valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<!0> class [mscorlib]System.Threading.Tasks.Task`1<string>::GetAwaiter()
	    IL_013f:  stloc.s 10
	    IL_0141:  ldloca.s 10
	    IL_0143:  call instance bool valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<string>::get_IsCompleted()
	    IL_0148:  brtrue.s IL_018b

	    IL_014a:  ldarg.0 
	    IL_014b:  ldc.i4.0 
	    IL_014c:  dup 
	    IL_014d:  stloc.0 
	    IL_014e:  stfld int32 Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>1__state'
	    IL_0153:  ldarg.0 
	    IL_0154:  ldloc.s 10
	    IL_0156:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<string> Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>u__1'
	    IL_015b:  ldarg.0 
	    IL_015c:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>t__builder'
	    IL_0161:  ldloca.s 10
	    IL_0163:  ldarg.0 
	    IL_0164:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::AwaitUnsafeOnCompleted<valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<string>, valuetype Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'> ([out] !!0&, [out] !!1&)
	    IL_0169:  leave IL_0620

	    IL_016e:  ldarg.0 
	    IL_016f:  ldfld valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<string> Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>u__1'
	    IL_0174:  stloc.s 10
	    IL_0176:  ldarg.0 
	    IL_0177:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<string> Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>u__1'
	    IL_017c:  initobj valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<string>
	    IL_0182:  ldarg.0 
	    IL_0183:  ldc.i4.m1 
	    IL_0184:  dup 
	    IL_0185:  stloc.0 
	    IL_0186:  stfld int32 Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>1__state'
	    IL_018b:  ldloca.s 10
	    IL_018d:  call instance !0 valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<string>::GetResult()
	    IL_0192:  stloc.s 9
	    IL_0194:  ldloc.s 9
	    IL_0196:  stloc.s 5
	    IL_0198:  leave.s IL_01b2

	  } // end .try 0
	  finally  { // 0
	    IL_019a:  ldloc.0 
	    IL_019b:  ldc.i4.0 
	    IL_019c:  bge.s IL_01b1

	    IL_019e:  ldarg.0 
	    IL_019f:  ldfld class [mscorlib]System.IO.StreamReader Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<sr>5__2'
	    IL_01a4:  brfalse.s IL_01b1

	    IL_01a6:  ldarg.0 
	    IL_01a7:  ldfld class [mscorlib]System.IO.StreamReader Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<sr>5__2'
	    IL_01ac:  callvirt instance void class [mscorlib]System.IDisposable::Dispose()
	    IL_01b1:  endfinally 
	  } // end handler 0
	  IL_01b2:  ldarg.0 
	  IL_01b3:  ldnull 
	  IL_01b4:  stfld class [mscorlib]System.IO.StreamReader Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<sr>5__2'
	  IL_01b9:  ldnull 
	  IL_01ba:  stloc.s 6
	  .try { // 1
	    IL_01bc:  newobj instance void class [System.Web.Extensions]System.Web.Script.Serialization.JavaScriptSerializer::'.ctor'()
	    IL_01c1:  stloc.s 11
	    IL_01c3:  ldloc.s 11
	    IL_01c5:  ldloc.s 5
	    IL_01c7:  callvirt instance !!0 class [System.Web.Extensions]System.Web.Script.Serialization.JavaScriptSerializer::Deserialize<class [mscorlib]System.Collections.Generic.Dictionary`2<string,object>> (string)
	    IL_01cc:  stloc.s 12
	    IL_01ce:  ldloc.s 12
	    IL_01d0:  brfalse.s IL_01fa

	    IL_01d2:  ldloc.s 12
	    IL_01d4:  ldstr "url"
	    IL_01d9:  callvirt instance bool class [mscorlib]System.Collections.Generic.Dictionary`2<string, object>::ContainsKey(!0)
	    IL_01de:  brfalse.s IL_01fa

	    IL_01e0:  ldloc.s 12
	    IL_01e2:  ldstr "url"
	    IL_01e7:  callvirt instance !1 class [mscorlib]System.Collections.Generic.Dictionary`2<string, object>::get_Item(!0)
	    IL_01ec:  dup 
	    IL_01ed:  brtrue.s IL_01f3

	    IL_01ef:  pop 
	    IL_01f0:  ldnull 
	    IL_01f1:  br.s IL_01f8

	    IL_01f3:  callvirt instance string object::ToString()
	    IL_01f8:  stloc.s 6
	    IL_01fa:  leave.s IL_01ff

	  } // end .try 1
	  catch class [mscorlib]System.Object { // 1
	    IL_01fc:  pop 
	    IL_01fd:  leave.s IL_01ff

	  } // end handler 1
	  IL_01ff:  ldloc.s 6
	  IL_0201:  call bool string::IsNullOrWhiteSpace(string)
	  IL_0206:  brtrue.s IL_0214

	  IL_0208:  ldloc.s 6
	  IL_020a:  ldc.i4.1 
	  IL_020b:  ldloca.s 7
	  IL_020d:  call bool class [System]System.Uri::TryCreate(string, valuetype [System]System.UriKind, [out] class [System]System.Uri&)
	  IL_0212:  brtrue.s IL_0245

	  IL_0214:  ldarg.0 
	  IL_0215:  ldfld class [System.Web]System.Web.HttpContext Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::context
	  IL_021a:  callvirt instance class [System.Web]System.Web.HttpResponse class [System.Web]System.Web.HttpContext::get_Response()
	  IL_021f:  ldc.i4 400
	  IL_0224:  callvirt instance void class [System.Web]System.Web.HttpResponse::set_StatusCode(int32)
	  IL_0229:  ldloc.1 
	  IL_022a:  ldarg.0 
	  IL_022b:  ldfld class [System.Web]System.Web.HttpContext Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::context
	  IL_0230:  ldc.i4.0 
	  IL_0231:  ldstr "missing or invalid url"
	  IL_0236:  newobj instance void class '<>f__AnonymousType0`2'<bool, string>::'.ctor'(!0, !1)
	  IL_023b:  call instance void class Health.Handlers.HealthHandler::WriteJson(class [System.Web]System.Web.HttpContext, object)
	  IL_0240:  leave IL_060d

	  IL_0245:  ldc.r8 5.
	  IL_024e:  call valuetype [mscorlib]System.TimeSpan valuetype [mscorlib]System.TimeSpan::FromSeconds(float64)
	  IL_0253:  stloc.s 8
	  IL_0255:  nop 
	  .try { // 4
	    IL_0256:  ldloc.0 
	    IL_0257:  ldc.i4.1 
	    IL_0258:  sub 
	    IL_0259:  ldc.i4.1 
	    IL_025a:  ble.un.s IL_0283

	    IL_025c:  ldstr ""
	    IL_0261:  stloc.s 13
	    IL_0263:  ldarg.0 
	    IL_0264:  newobj instance void class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair>::'.ctor'()
	    IL_0269:  stfld class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair> Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<headers>5__3'
	    IL_026e:  ldc.i4 3072
	    IL_0273:  call void class [System]System.Net.ServicePointManager::set_SecurityProtocol(valuetype [System]System.Net.SecurityProtocolType)
	    IL_0278:  ldarg.0 
	    IL_0279:  newobj instance void class [System]System.Net.WebClient::'.ctor'()
	    IL_027e:  stfld class [System]System.Net.WebClient Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<client>5__4'
	    IL_0283:  nop 
	    .try { // 3
	      IL_0284:  ldloc.0 
	      IL_0285:  ldc.i4.1 
	      IL_0286:  beq.s IL_02fb

	      IL_0288:  ldloc.0 
	      IL_0289:  ldc.i4.2 
	      IL_028a:  beq IL_037e

	      IL_028f:  ldarg.0 
	      IL_0290:  ldfld class [System]System.Net.WebClient Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<client>5__4'
	      IL_0295:  callvirt instance class [System]System.Net.WebHeaderCollection class [System]System.Net.WebClient::get_Headers()
	      IL_029a:  ldc.i4.s 0x28
	      IL_029c:  ldstr "AdminHealthCheck-WebClient/1.0"
	      IL_02a1:  callvirt instance void class [System]System.Net.WebHeaderCollection::Add(valuetype [System]System.Net.HttpRequestHeader, string)
	      IL_02a6:  ldarg.0 
	      IL_02a7:  ldarg.0 
	      IL_02a8:  ldfld class [System]System.Net.WebClient Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<client>5__4'
	      IL_02ad:  ldloc.s 7
	      IL_02af:  callvirt instance class [mscorlib]System.Threading.Tasks.Task`1<string> class [System]System.Net.WebClient::DownloadStringTaskAsync(class [System]System.Uri)
	      IL_02b4:  stfld class [mscorlib]System.Threading.Tasks.Task`1<string> Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<downloadTask>5__5'
	      IL_02b9:  ldloc.1 
	      IL_02ba:  ldarg.0 
	      IL_02bb:  ldfld class [mscorlib]System.Threading.Tasks.Task`1<string> Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<downloadTask>5__5'
	      IL_02c0:  ldloc.s 8
	      IL_02c2:  call instance class [mscorlib]System.Threading.Tasks.Task`1<bool> class Health.Handlers.HealthHandler::TaskWhenAnyWithTimeout(class [mscorlib]System.Threading.Tasks.Task, valuetype [mscorlib]System.TimeSpan)
	      IL_02c7:  callvirt instance valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<!0> class [mscorlib]System.Threading.Tasks.Task`1<bool>::GetAwaiter()
	      IL_02cc:  stloc.s 18
	      IL_02ce:  ldloca.s 18
	      IL_02d0:  call instance bool valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<bool>::get_IsCompleted()
	      IL_02d5:  brtrue.s IL_0318

	      IL_02d7:  ldarg.0 
	      IL_02d8:  ldc.i4.1 
	      IL_02d9:  dup 
	      IL_02da:  stloc.0 
	      IL_02db:  stfld int32 Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>1__state'
	      IL_02e0:  ldarg.0 
	      IL_02e1:  ldloc.s 18
	      IL_02e3:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<bool> Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>u__2'
	      IL_02e8:  ldarg.0 
	      IL_02e9:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>t__builder'
	      IL_02ee:  ldloca.s 18
	      IL_02f0:  ldarg.0 
	      IL_02f1:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::AwaitUnsafeOnCompleted<valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<bool>, valuetype Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'> ([out] !!0&, [out] !!1&)
	      IL_02f6:  leave IL_0620

	      IL_02fb:  ldarg.0 
	      IL_02fc:  ldfld valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<bool> Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>u__2'
	      IL_0301:  stloc.s 18
	      IL_0303:  ldarg.0 
	      IL_0304:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<bool> Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>u__2'
	      IL_0309:  initobj valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<bool>
	      IL_030f:  ldarg.0 
	      IL_0310:  ldc.i4.m1 
	      IL_0311:  dup 
	      IL_0312:  stloc.0 
	      IL_0313:  stfld int32 Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>1__state'
	      IL_0318:  ldloca.s 18
	      IL_031a:  call instance !0 valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<bool>::GetResult()
	      IL_031f:  stloc.s 17
	      IL_0321:  ldloc.s 17
	      IL_0323:  stloc.s 15
	      IL_0325:  ldloc.s 15
	      IL_0327:  brtrue.s IL_0344

	      .try { // 2
	        IL_0329:  ldarg.0 
	        IL_032a:  ldfld class [System]System.Net.WebClient Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<client>5__4'
	        IL_032f:  callvirt instance void class [System]System.Net.WebClient::CancelAsync()
	        IL_0334:  leave.s IL_0339

	      } // end .try 2
	      catch class [mscorlib]System.Object { // 2
	        IL_0336:  pop 
	        IL_0337:  leave.s IL_0339

	      } // end handler 2
	      IL_0339:  ldstr "request timed out"
	      IL_033e:  newobj instance void class [mscorlib]System.TimeoutException::'.ctor'(string)
	      IL_0343:  throw 
	      IL_0344:  ldarg.0 
	      IL_0345:  ldfld class [mscorlib]System.Threading.Tasks.Task`1<string> Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<downloadTask>5__5'
	      IL_034a:  callvirt instance valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<!0> class [mscorlib]System.Threading.Tasks.Task`1<string>::GetAwaiter()
	      IL_034f:  stloc.s 20
	      IL_0351:  ldloca.s 20
	      IL_0353:  call instance bool valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<string>::get_IsCompleted()
	      IL_0358:  brtrue.s IL_039b

	      IL_035a:  ldarg.0 
	      IL_035b:  ldc.i4.2 
	      IL_035c:  dup 
	      IL_035d:  stloc.0 
	      IL_035e:  stfld int32 Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>1__state'
	      IL_0363:  ldarg.0 
	      IL_0364:  ldloc.s 20
	      IL_0366:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<string> Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>u__1'
	      IL_036b:  ldarg.0 
	      IL_036c:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>t__builder'
	      IL_0371:  ldloca.s 20
	      IL_0373:  ldarg.0 
	      IL_0374:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::AwaitUnsafeOnCompleted<valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<string>, valuetype Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'> ([out] !!0&, [out] !!1&)
	      IL_0379:  leave IL_0620

	      IL_037e:  ldarg.0 
	      IL_037f:  ldfld valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<string> Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>u__1'
	      IL_0384:  stloc.s 20
	      IL_0386:  ldarg.0 
	      IL_0387:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<string> Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>u__1'
	      IL_038c:  initobj valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<string>
	      IL_0392:  ldarg.0 
	      IL_0393:  ldc.i4.m1 
	      IL_0394:  dup 
	      IL_0395:  stloc.0 
	      IL_0396:  stfld int32 Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>1__state'
	      IL_039b:  ldloca.s 20
	      IL_039d:  call instance !0 valuetype [mscorlib]System.Runtime.CompilerServices.TaskAwaiter`1<string>::GetResult()
	      IL_03a2:  stloc.s 19
	      IL_03a4:  ldloc.s 19
	      IL_03a6:  stloc.s 13
	      IL_03a8:  ldarg.0 
	      IL_03a9:  ldfld class [System]System.Net.WebClient Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<client>5__4'
	      IL_03ae:  callvirt instance class [System]System.Net.WebHeaderCollection class [System]System.Net.WebClient::get_ResponseHeaders()
	      IL_03b3:  stloc.s 16
	      IL_03b5:  ldloc.s 16
	      IL_03b7:  brfalse.s IL_0438

	      IL_03b9:  ldloc.s 16
	      IL_03bb:  callvirt instance string[] class [System]System.Collections.Specialized.NameValueCollection::get_AllKeys()
	      IL_03c0:  stloc.s 21
	      IL_03c2:  ldc.i4.0 
	      IL_03c3:  stloc.s 22
	      IL_03c5:  br.s IL_0430

	      IL_03c7:  ldloc.s 21
	      IL_03c9:  ldloc.s 22
	      IL_03cb:  ldelem.ref 
	      IL_03cc:  stloc.s 23
	      IL_03ce:  ldloc.s 16
	      IL_03d0:  ldloc.s 23
	      IL_03d2:  callvirt instance string class [System]System.Collections.Specialized.NameValueCollection::get_Item(string)
	      IL_03d7:  stloc.s 24
	      IL_03d9:  ldloc.s 24
	      IL_03db:  brfalse.s IL_0404

	      IL_03dd:  ldloc.s 24
	      IL_03df:  callvirt instance int32 string::get_Length()
	      IL_03e4:  ldc.i4 200
	      IL_03e9:  ble.s IL_0404

	      IL_03eb:  ldloc.s 24
	      IL_03ed:  ldc.i4.0 
	      IL_03ee:  ldc.i4 197
	      IL_03f3:  callvirt instance string string::Substring(int32, int32)
	      IL_03f8:  ldstr "..."
	      IL_03fd:  call string string::Concat(string, string)
	      IL_0402:  stloc.s 24
	      IL_0404:  ldarg.0 
	      IL_0405:  ldfld class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair> Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<headers>5__3'
	      IL_040a:  ldloc.s 23
	      IL_040c:  dup 
	      IL_040d:  brtrue.s IL_0415

	      IL_040f:  pop 
	      IL_0410:  ldstr "(null)"
	      IL_0415:  ldloc.s 24
	      IL_0417:  dup 
	      IL_0418:  brtrue.s IL_0420

	      IL_041a:  pop 
	      IL_041b:  ldstr ""
	      IL_0420:  newobj instance void class Health.Handlers.HeaderPair::'.ctor'(string, string)
	      IL_0425:  callvirt instance void class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair>::Add(!0)
	      IL_042a:  ldloc.s 22
	      IL_042c:  ldc.i4.1 
	      IL_042d:  add 
	      IL_042e:  stloc.s 22
	      IL_0430:  ldloc.s 22
	      IL_0432:  ldloc.s 21
	      IL_0434:  ldlen 
	      IL_0435:  conv.i4 
	      IL_0436:  blt.s IL_03c7

	      IL_0438:  ldarg.0 
	      IL_0439:  ldnull 
	      IL_043a:  stfld class [mscorlib]System.Threading.Tasks.Task`1<string> Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<downloadTask>5__5'
	      IL_043f:  leave.s IL_0459

	    } // end .try 3
	    finally  { // 3
	      IL_0441:  ldloc.0 
	      IL_0442:  ldc.i4.0 
	      IL_0443:  bge.s IL_0458

	      IL_0445:  ldarg.0 
	      IL_0446:  ldfld class [System]System.Net.WebClient Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<client>5__4'
	      IL_044b:  brfalse.s IL_0458

	      IL_044d:  ldarg.0 
	      IL_044e:  ldfld class [System]System.Net.WebClient Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<client>5__4'
	      IL_0453:  callvirt instance void class [mscorlib]System.IDisposable::Dispose()
	      IL_0458:  endfinally 
	    } // end handler 3
	    IL_0459:  ldarg.0 
	    IL_045a:  ldnull 
	    IL_045b:  stfld class [System]System.Net.WebClient Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<client>5__4'
	    IL_0460:  ldloc.s 13
	    IL_0462:  callvirt instance int32 string::get_Length()
	    IL_0467:  ldc.i4 4096
	    IL_046c:  bgt.s IL_0472

	    IL_046e:  ldloc.s 13
	    IL_0470:  br.s IL_0489

	    IL_0472:  ldloc.s 13
	    IL_0474:  ldc.i4.0 
	    IL_0475:  ldc.i4 4093
	    IL_047a:  callvirt instance string string::Substring(int32, int32)
	    IL_047f:  ldstr "..."
	    IL_0484:  call string string::Concat(string, string)
	    IL_0489:  stloc.s 14
	    IL_048b:  ldloc.1 
	    IL_048c:  ldarg.0 
	    IL_048d:  ldfld class [System.Web]System.Web.HttpContext Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::context
	    IL_0492:  ldc.i4.1 
	    IL_0493:  ldc.i4 200
	    IL_0498:  ldarg.0 
	    IL_0499:  ldfld class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair> Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<headers>5__3'
	    IL_049e:  ldloc.s 14
	    IL_04a0:  ldnull 
	    IL_04a1:  newobj instance void class Health.Handlers.HealthcheckResponse::'.ctor'(bool, int32, class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair>, string, string)
	    IL_04a6:  call instance void class Health.Handlers.HealthHandler::WriteJson(class [System.Web]System.Web.HttpContext, object)
	    IL_04ab:  ldarg.0 
	    IL_04ac:  ldnull 
	    IL_04ad:  stfld class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair> Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<headers>5__3'
	    IL_04b2:  leave IL_05f2

	  } // end .try 4
	  catch class [mscorlib]System.TimeoutException { // 4
	    IL_04b7:  stloc.s 25
	    IL_04b9:  ldarg.0 
	    IL_04ba:  ldfld class [System.Web]System.Web.HttpContext Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::context
	    IL_04bf:  callvirt instance class [System.Web]System.Web.HttpResponse class [System.Web]System.Web.HttpContext::get_Response()
	    IL_04c4:  ldc.i4 504
	    IL_04c9:  callvirt instance void class [System.Web]System.Web.HttpResponse::set_StatusCode(int32)
	    IL_04ce:  ldloc.1 
	    IL_04cf:  ldarg.0 
	    IL_04d0:  ldfld class [System.Web]System.Web.HttpContext Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::context
	    IL_04d5:  ldc.i4.0 
	    IL_04d6:  ldc.i4.0 
	    IL_04d7:  newobj instance void class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair>::'.ctor'()
	    IL_04dc:  ldstr ""
	    IL_04e1:  ldloc.s 25
	    IL_04e3:  callvirt instance string class [mscorlib]System.Exception::get_Message()
	    IL_04e8:  newobj instance void class Health.Handlers.HealthcheckResponse::'.ctor'(bool, int32, class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair>, string, string)
	    IL_04ed:  call instance void class Health.Handlers.HealthHandler::WriteJson(class [System.Web]System.Web.HttpContext, object)
	    IL_04f2:  leave IL_05f2

	  } // end handler 4
	  catch class [System]System.Net.WebException { // 5
	    IL_04f7:  stloc.s 26
	    IL_04f9:  newobj instance void class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair>::'.ctor'()
	    IL_04fe:  stloc.s 27
	    IL_0500:  ldc.i4.0 
	    IL_0501:  stloc.s 28
	    IL_0503:  ldloc.s 26
	    IL_0505:  callvirt instance class [System]System.Net.WebResponse class [System]System.Net.WebException::get_Response()
	    IL_050a:  isinst [System]System.Net.HttpWebResponse
	    IL_050f:  stloc.s 29
	    IL_0511:  ldloc.s 29
	    IL_0513:  brfalse IL_05a6

	    IL_0518:  ldloc.s 29
	    IL_051a:  callvirt instance valuetype [System]System.Net.HttpStatusCode class [System]System.Net.HttpWebResponse::get_StatusCode()
	    IL_051f:  stloc.s 28
	    IL_0521:  ldloc.s 29
	    IL_0523:  callvirt instance class [System]System.Net.WebHeaderCollection class [System]System.Net.WebResponse::get_Headers()
	    IL_0528:  callvirt instance string[] class [System]System.Collections.Specialized.NameValueCollection::get_AllKeys()
	    IL_052d:  stloc.s 30
	    IL_052f:  ldc.i4.0 
	    IL_0530:  stloc.s 31
	    IL_0532:  br.s IL_059e

	    IL_0534:  ldloc.s 30
	    IL_0536:  ldloc.s 31
	    IL_0538:  ldelem.ref 
	    IL_0539:  stloc.s 32
	    IL_053b:  ldloc.s 29
	    IL_053d:  callvirt instance class [System]System.Net.WebHeaderCollection class [System]System.Net.WebResponse::get_Headers()
	    IL_0542:  ldloc.s 32
	    IL_0544:  callvirt instance string class [System]System.Collections.Specialized.NameValueCollection::get_Item(string)
	    IL_0549:  stloc.s 33
	    IL_054b:  ldloc.s 33
	    IL_054d:  brfalse.s IL_0576

	    IL_054f:  ldloc.s 33
	    IL_0551:  callvirt instance int32 string::get_Length()
	    IL_0556:  ldc.i4 200
	    IL_055b:  ble.s IL_0576

	    IL_055d:  ldloc.s 33
	    IL_055f:  ldc.i4.0 
	    IL_0560:  ldc.i4 197
	    IL_0565:  callvirt instance string string::Substring(int32, int32)
	    IL_056a:  ldstr "..."
	    IL_056f:  call string string::Concat(string, string)
	    IL_0574:  stloc.s 33
	    IL_0576:  ldloc.s 27
	    IL_0578:  ldloc.s 32
	    IL_057a:  dup 
	    IL_057b:  brtrue.s IL_0583

	    IL_057d:  pop 
	    IL_057e:  ldstr "(null)"
	    IL_0583:  ldloc.s 33
	    IL_0585:  dup 
	    IL_0586:  brtrue.s IL_058e

	    IL_0588:  pop 
	    IL_0589:  ldstr ""
	    IL_058e:  newobj instance void class Health.Handlers.HeaderPair::'.ctor'(string, string)
	    IL_0593:  callvirt instance void class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair>::Add(!0)
	    IL_0598:  ldloc.s 31
	    IL_059a:  ldc.i4.1 
	    IL_059b:  add 
	    IL_059c:  stloc.s 31
	    IL_059e:  ldloc.s 31
	    IL_05a0:  ldloc.s 30
	    IL_05a2:  ldlen 
	    IL_05a3:  conv.i4 
	    IL_05a4:  blt.s IL_0534

	    IL_05a6:  ldloc.1 
	    IL_05a7:  ldarg.0 
	    IL_05a8:  ldfld class [System.Web]System.Web.HttpContext Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::context
	    IL_05ad:  ldc.i4.0 
	    IL_05ae:  ldloc.s 28
	    IL_05b0:  ldloc.s 27
	    IL_05b2:  ldstr ""
	    IL_05b7:  ldloc.s 26
	    IL_05b9:  callvirt instance string class [mscorlib]System.Exception::get_Message()
	    IL_05be:  newobj instance void class Health.Handlers.HealthcheckResponse::'.ctor'(bool, int32, class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair>, string, string)
	    IL_05c3:  call instance void class Health.Handlers.HealthHandler::WriteJson(class [System.Web]System.Web.HttpContext, object)
	    IL_05c8:  leave.s IL_05f2

	  } // end handler 5
	  catch class [mscorlib]System.Exception { // 6
	    IL_05ca:  stloc.s 34
	    IL_05cc:  ldloc.1 
	    IL_05cd:  ldarg.0 
	    IL_05ce:  ldfld class [System.Web]System.Web.HttpContext Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::context
	    IL_05d3:  ldc.i4.0 
	    IL_05d4:  ldc.i4.0 
	    IL_05d5:  newobj instance void class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair>::'.ctor'()
	    IL_05da:  ldstr ""
	    IL_05df:  ldloc.s 34
	    IL_05e1:  callvirt instance string class [mscorlib]System.Exception::get_Message()
	    IL_05e6:  newobj instance void class Health.Handlers.HealthcheckResponse::'.ctor'(bool, int32, class [mscorlib]System.Collections.Generic.List`1<class Health.Handlers.HeaderPair>, string, string)
	    IL_05eb:  call instance void class Health.Handlers.HealthHandler::WriteJson(class [System.Web]System.Web.HttpContext, object)
	    IL_05f0:  leave.s IL_05f2

	  } // end handler 6
	  IL_05f2:  leave.s IL_060d

	} // end .try 7
	catch class [mscorlib]System.Exception { // 7
	  IL_05f4:  stloc.s 35
	  IL_05f6:  ldarg.0 
	  IL_05f7:  ldc.i4.s 0xfffffffe
	  IL_05f9:  stfld int32 Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>1__state'
	  IL_05fe:  ldarg.0 
	  IL_05ff:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>t__builder'
	  IL_0604:  ldloc.s 35
	  IL_0606:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::SetException(class [mscorlib]System.Exception)
	  IL_060b:  leave.s IL_0620

	} // end handler 7
	IL_060d:  ldarg.0 
	IL_060e:  ldc.i4.s 0xfffffffe
	IL_0610:  stfld int32 Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>1__state'
	IL_0615:  ldarg.0 
	IL_0616:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>t__builder'
	IL_061b:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::SetResult()
	IL_0620:  ret 
    } // end of method <ProcessRequestAsync>d__4::MoveNext

    // method line 48
    .method private final virtual hidebysig newslot 
           instance default void SetStateMachine (class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine stateMachine)  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x2ba8
	.override class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine::SetStateMachine
	// Code size 13 (0xd)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder Health.Handlers.HealthHandler/'<ProcessRequestAsync>d__4'::'<>t__builder'
	IL_0006:  ldarg.1 
	IL_0007:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder::SetStateMachine(class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine)
	IL_000c:  ret 
    } // end of method <ProcessRequestAsync>d__4::SetStateMachine

  } // end of class <ProcessRequestAsync>d__4

  .class nested private auto ansi sealed beforefieldinit '<TaskWhenAnyWithTimeout>d__6'
  	extends [mscorlib]System.ValueType
  	implements [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine  {
    .custom instance void class [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::'.ctor'() =  (01 00 00 00 ) // ....

    .field  public  int32 '<>1__state'
    .field  public  valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<bool> '<>t__builder'
    .field  public  valuetype [mscorlib]System.TimeSpan timeout
    .field  public  class [mscorlib]System.Threading.Tasks.Task t
    .field  private  valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<class [mscorlib]System.Threading.Tasks.Task> '<>u__1'

    // method line 49
    .method private final virtual hidebysig newslot 
           instance default void MoveNext ()  cil managed 
    {
        // Method begins at RVA 0x2bb8
	.override class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine::MoveNext
	// Code size 204 (0xcc)
	.maxstack 4
	.locals init (
		int32	V_0,
		bool	V_1,
		class [mscorlib]System.Threading.Tasks.Task	V_2,
		class [mscorlib]System.Threading.Tasks.Task	V_3,
		class [mscorlib]System.Threading.Tasks.Task	V_4,
		valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<class [mscorlib]System.Threading.Tasks.Task>	V_5,
		valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1<class [mscorlib]System.Threading.Tasks.Task>	V_6,
		class [mscorlib]System.Exception	V_7)
	IL_0000:  ldarg.0 
	IL_0001:  ldfld int32 Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'::'<>1__state'
	IL_0006:  stloc.0 
	.try { // 0
	  IL_0007:  ldloc.0 
	  IL_0008:  brfalse.s IL_0069

	  IL_000a:  ldarg.0 
	  IL_000b:  ldfld valuetype [mscorlib]System.TimeSpan Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'::timeout
	  IL_0010:  call class [mscorlib]System.Threading.Tasks.Task class [mscorlib]System.Threading.Tasks.Task::Delay(valuetype [mscorlib]System.TimeSpan)
	  IL_0015:  stloc.2 
	  IL_0016:  ldc.i4.2 
	  IL_0017:  newarr [mscorlib]System.Threading.Tasks.Task
	  IL_001c:  dup 
	  IL_001d:  ldc.i4.0 
	  IL_001e:  ldarg.0 
	  IL_001f:  ldfld class [mscorlib]System.Threading.Tasks.Task Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'::t
	  IL_0024:  stelem.ref 
	  IL_0025:  dup 
	  IL_0026:  ldc.i4.1 
	  IL_0027:  ldloc.2 
	  IL_0028:  stelem.ref 
	  IL_0029:  call class [mscorlib]System.Threading.Tasks.Task`1<class [mscorlib]System.Threading.Tasks.Task> class [mscorlib]System.Threading.Tasks.Task::WhenAny(class [mscorlib]System.Threading.Tasks.Task[])
	  IL_002e:  ldc.i4.0 
	  IL_002f:  callvirt instance valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1<!0> class [mscorlib]System.Threading.Tasks.Task`1<class [mscorlib]System.Threading.Tasks.Task>::ConfigureAwait(bool)
	  IL_0034:  stloc.s 6
	  IL_0036:  ldloca.s 6
	  IL_0038:  call instance valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<!0> valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1<class [mscorlib]System.Threading.Tasks.Task>::GetAwaiter()
	  IL_003d:  stloc.s 5
	  IL_003f:  ldloca.s 5
	  IL_0041:  call instance bool valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<class [mscorlib]System.Threading.Tasks.Task>::get_IsCompleted()
	  IL_0046:  brtrue.s IL_0086

	  IL_0048:  ldarg.0 
	  IL_0049:  ldc.i4.0 
	  IL_004a:  dup 
	  IL_004b:  stloc.0 
	  IL_004c:  stfld int32 Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'::'<>1__state'
	  IL_0051:  ldarg.0 
	  IL_0052:  ldloc.s 5
	  IL_0054:  stfld valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<class [mscorlib]System.Threading.Tasks.Task> Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'::'<>u__1'
	  IL_0059:  ldarg.0 
	  IL_005a:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<bool> Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'::'<>t__builder'
	  IL_005f:  ldloca.s 5
	  IL_0061:  ldarg.0 
	  IL_0062:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<bool>::AwaitUnsafeOnCompleted<valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<class [mscorlib]System.Threading.Tasks.Task>, valuetype Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'> ([out] !!0&, [out] !!1&)
	  IL_0067:  leave.s IL_00cb

	  IL_0069:  ldarg.0 
	  IL_006a:  ldfld valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<class [mscorlib]System.Threading.Tasks.Task> Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'::'<>u__1'
	  IL_006f:  stloc.s 5
	  IL_0071:  ldarg.0 
	  IL_0072:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<class [mscorlib]System.Threading.Tasks.Task> Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'::'<>u__1'
	  IL_0077:  initobj valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<class [mscorlib]System.Threading.Tasks.Task>
	  IL_007d:  ldarg.0 
	  IL_007e:  ldc.i4.m1 
	  IL_007f:  dup 
	  IL_0080:  stloc.0 
	  IL_0081:  stfld int32 Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'::'<>1__state'
	  IL_0086:  ldloca.s 5
	  IL_0088:  call instance !0 valuetype [mscorlib]System.Runtime.CompilerServices.ConfiguredTaskAwaitable`1/ConfiguredTaskAwaiter<class [mscorlib]System.Threading.Tasks.Task>::GetResult()
	  IL_008d:  stloc.s 4
	  IL_008f:  ldloc.s 4
	  IL_0091:  stloc.3 
	  IL_0092:  ldloc.3 
	  IL_0093:  ldarg.0 
	  IL_0094:  ldfld class [mscorlib]System.Threading.Tasks.Task Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'::t
	  IL_0099:  ceq 
	  IL_009b:  stloc.1 
	  IL_009c:  leave.s IL_00b7

	} // end .try 0
	catch class [mscorlib]System.Exception { // 0
	  IL_009e:  stloc.s 7
	  IL_00a0:  ldarg.0 
	  IL_00a1:  ldc.i4.s 0xfffffffe
	  IL_00a3:  stfld int32 Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'::'<>1__state'
	  IL_00a8:  ldarg.0 
	  IL_00a9:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<bool> Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'::'<>t__builder'
	  IL_00ae:  ldloc.s 7
	  IL_00b0:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<bool>::SetException(class [mscorlib]System.Exception)
	  IL_00b5:  leave.s IL_00cb

	} // end handler 0
	IL_00b7:  ldarg.0 
	IL_00b8:  ldc.i4.s 0xfffffffe
	IL_00ba:  stfld int32 Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'::'<>1__state'
	IL_00bf:  ldarg.0 
	IL_00c0:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<bool> Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'::'<>t__builder'
	IL_00c5:  ldloc.1 
	IL_00c6:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<bool>::SetResult(!0)
	IL_00cb:  ret 
    } // end of method <TaskWhenAnyWithTimeout>d__6::MoveNext

    // method line 50
    .method private final virtual hidebysig newslot 
           instance default void SetStateMachine (class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine stateMachine)  cil managed 
    {
        .custom instance void class [mscorlib]System.Diagnostics.DebuggerHiddenAttribute::'.ctor'() =  (01 00 00 00 ) // ....

        // Method begins at RVA 0x2ca0
	.override class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine::SetStateMachine
	// Code size 13 (0xd)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  ldflda valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<bool> Health.Handlers.HealthHandler/'<TaskWhenAnyWithTimeout>d__6'::'<>t__builder'
	IL_0006:  ldarg.1 
	IL_0007:  call instance void valuetype [mscorlib]System.Runtime.CompilerServices.AsyncTaskMethodBuilder`1<bool>::SetStateMachine(class [mscorlib]System.Runtime.CompilerServices.IAsyncStateMachine)
	IL_000c:  ret 
    } // end of method <TaskWhenAnyWithTimeout>d__6::SetStateMachine

  } // end of class <TaskWhenAnyWithTimeout>d__6

  } // end of class Health.Handlers.HealthHandler
}

.namespace AdminPages
{
  .class public auto ansi beforefieldinit AdminPage
  	extends [System.Web]System.Web.UI.Page
  {
    .field  family  class [System.Web]System.Web.UI.HtmlControls.HtmlForm form1
    .field  family  class [System.Web]System.Web.UI.WebControls.HiddenField csrf_token

    // method line 43
    .method family hidebysig 
           instance default void Page_Load (object sender, class [mscorlib]System.EventArgs e)  cil managed 
    {
        // Method begins at RVA 0x23e0
	// Code size 178 (0xb2)
	.maxstack 5
	.locals init (
		string	V_0,
		string	V_1,
		class [System.Web]System.Web.HttpCookie	V_2,
		valuetype [mscorlib]System.Guid	V_3)
	IL_0000:  ldarg.0 
	IL_0001:  call instance class [System.Web]System.Web.HttpRequest class [System.Web]System.Web.UI.Page::get_Request()
	IL_0006:  callvirt instance class [System.Web]System.Web.HttpCookieCollection class [System.Web]System.Web.HttpRequest::get_Cookies()
	IL_000b:  ldstr "__AntiXsrfToken"
	IL_0010:  callvirt instance class [System.Web]System.Web.HttpCookie class [System.Web]System.Web.HttpCookieCollection::get_Item(string)
	IL_0015:  dup 
	IL_0016:  brtrue.s IL_001c

	IL_0018:  pop 
	IL_0019:  ldnull 
	IL_001a:  br.s IL_0021

	IL_001c:  call instance string class [System.Web]System.Web.HttpCookie::get_Value()
	IL_0021:  stloc.0 
	IL_0022:  ldloc.0 
	IL_0023:  call bool string::IsNullOrEmpty(string)
	IL_0028:  brfalse.s IL_0061

	IL_002a:  call valuetype [mscorlib]System.Guid valuetype [mscorlib]System.Guid::NewGuid()
	IL_002f:  stloc.3 
	IL_0030:  ldloca.s 3
	IL_0032:  ldstr "N"
	IL_0037:  call instance string valuetype [mscorlib]System.Guid::ToString(string)
	IL_003c:  stloc.0 
	IL_003d:  ldstr "__AntiXsrfToken"
	IL_0042:  ldloc.0 
	IL_0043:  newobj instance void class [System.Web]System.Web.HttpCookie::'.ctor'(string, string)
	IL_0048:  dup 
	IL_0049:  ldc.i4.1 
	IL_004a:  callvirt instance void class [System.Web]System.Web.HttpCookie::set_HttpOnly(bool)
	IL_004f:  stloc.2 
	IL_0050:  ldarg.0 
	IL_0051:  call instance class [System.Web]System.Web.HttpResponse class [System.Web]System.Web.UI.Page::get_Response()
	IL_0056:  callvirt instance class [System.Web]System.Web.HttpCookieCollection class [System.Web]System.Web.HttpResponse::get_Cookies()
	IL_005b:  ldloc.2 
	IL_005c:  callvirt instance void class [System.Web]System.Web.HttpCookieCollection::Add(class [System.Web]System.Web.HttpCookie)
	IL_0061:  ldarg.0 
	IL_0062:  callvirt instance class [System.Web]System.Web.SessionState.HttpSessionState class [System.Web]System.Web.UI.Page::get_Session()
	IL_0067:  ldstr "ANTI_XSRF"
	IL_006c:  ldloc.0 
	IL_006d:  callvirt instance void class [System.Web]System.Web.SessionState.HttpSessionState::set_Item(string, object)
	IL_0072:  ldarg.0 
	IL_0073:  ldfld class [System.Web]System.Web.UI.WebControls.HiddenField AdminPages.AdminPage::csrf_token
	IL_0078:  ldloc.0 
	IL_0079:  callvirt instance void class [System.Web]System.Web.UI.WebControls.HiddenField::set_Value(string)
	IL_007e:  ldstr "window.ANTI_XSRF_TOKEN = '"
	IL_0083:  ldloc.0 
	IL_0084:  call string class [System.Web]System.Web.HttpUtility::JavaScriptStringEncode(string)
	IL_0089:  ldstr "';"
	IL_008e:  call string string::Concat(string, string, string)
	IL_0093:  stloc.1 
	IL_0094:  ldarg.0 
	IL_0095:  callvirt instance class [System.Web]System.Web.UI.Page class [System.Web]System.Web.UI.Control::get_Page()
	IL_009a:  callvirt instance class [System.Web]System.Web.UI.ClientScriptManager class [System.Web]System.Web.UI.Page::get_ClientScript()
	IL_009f:  ldarg.0 
	IL_00a0:  call instance class [mscorlib]System.Type object::GetType()
	IL_00a5:  ldstr "AntiXsrfJS"
	IL_00aa:  ldloc.1 
	IL_00ab:  ldc.i4.1 
	IL_00ac:  callvirt instance void class [System.Web]System.Web.UI.ClientScriptManager::RegisterClientScriptBlock(class [mscorlib]System.Type, string, string, bool)
	IL_00b1:  ret 
    } // end of method AdminPage::Page_Load

    // method line 44
    .method public hidebysig specialname rtspecialname 
           instance default void '.ctor' ()  cil managed 
    {
        // Method begins at RVA 0x21d7
	// Code size 7 (0x7)
	.maxstack 8
	IL_0000:  ldarg.0 
	IL_0001:  call instance void class [System.Web]System.Web.UI.Page::'.ctor'()
	IL_0006:  ret 
    } // end of method AdminPage::.ctor

  } // end of class AdminPages.AdminPage
}

