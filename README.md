# C# Methods Code Snippets - for Visual Studio

## Summary

This is code snippets for appending method in C# code, for Visual Studio 2012 or above.

## How to install?

Download "C# Methods Code Snippets" Visual Studio Extension file (.vsix) from [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=jsakamoto.CMethodsCodeSnippets), and open it.

You can also install via Visual Studio [Tools] > [Extensions and Updates] dialog (search with keyword "method").

![fig.1](https://raw.githubusercontent.com/jsakamoto/CSharpMethodsCodeSnippets/master/.assets/fig001.png)

## How to use?

After installing of this snippet, you can use following code snippet shortcuts.

- **method** (snippet for instance method)
    - and "method1", "method2", "method3" are taking arguments edition. 
- **imethod** (snippet for interface method)
    - and "imethod1", "imethod2", "imethod3" are taking arguments edition. 
- **vmethod** (snippet for virtual instance method)
    - and "vmethod1", "vmethod2", "vmethod3" are taking arguments edition. 
- **smethod** (snippet for static method)
    - and "smethod1", "smethod2", "smethod3" are taking arguments edition. 
- **xmethod** (snippet for extension method)
    - and "xmethod1", "xmethod2", "xmethod3" are taking arguments edition. 
- **amethod** (snippet for an async instance method)
- **asmethod** (snippet for an async static method)
- **eh** (snippet for event handler method)
- **seh** (snippet for event handler static method)

## Examples

### ex.1) Instance method

```csharp
// Enter "method [Tab]", then...  
public void MyMethod()  {
    throw new NotImplementedException();
}

// Enter "method1 [Tab]", then...  
public void MyMethod(object arg)  {
    throw new NotImplementedException();
}

// Enter "method2 [Tab]", then...  
public void MyMethod(object arg1, object arg2)  {
    throw new NotImplementedException();
}

// Enter "method3 [Tab]", then...  
public void MyMethod(object arg1, object arg2, object arg3)  {
    throw new NotImplementedException();
}
```
### ex.2) Interface method

```csharp
// Enter "imethod [Tab]", then...  
public void MyMethod();

// Enter "imethod1 [Tab]", then...  
public void MyMethod(object arg);

// Enter "imethod2 [Tab]", then...  
public void MyMethod(object arg1, object arg2);

// Enter "imethod3 [Tab]", then...  
public void MyMethod(object arg1, object arg2, object arg3);
```

### ex.3) Virtual instance method

```csharp
// Enter "vmethod [Tab]", then...  
public virtual void MyMethod()  {
    throw new NotImplementedException();
}

// Enter "vmethod1 [Tab]", then...  
public virtual void MyMethod(object arg)  {
    throw new NotImplementedException();
}

// Enter "vmethod2 [Tab]", then...  
public virtual void MyMethod(object arg1, object arg2)  {
    throw new NotImplementedException();
}

// Enter "vmethod3 [Tab]", then...  
public virtual void MyMethod(object arg1, object arg2, object arg3)  {
    throw new NotImplementedException();
}
```

### ex.4) Static method

```csharp
// Enter "smethod [Tab]", then...  
public static void MyMethod()  {
    throw new NotImplementedException();
}

// Enter "smethod1 [Tab]", then...  
public static void MyMethod(object arg)  {
    throw new NotImplementedException();
}

// Enter "smethod2 [Tab]", then...  
public static void MyMethod(object arg1, object arg2)  {
    throw new NotImplementedException();
}

// Enter "smethod3 [Tab]", then...  
public static void MyMethod(object arg1, object arg2, object arg3)  {
    throw new NotImplementedException();
}
```
### ex.5) Extension method

```csharp
// Enter "xmethod [Tab]", then...  
public static void MyMethod(this object value)  {
    throw new NotImplementedException();
}

// Enter "xmethod1 [Tab]", then...  
public static void MyMethod(this object value, object arg)  {
    throw new NotImplementedException();
}

// Enter "xmethod2 [Tab]", then...  
public static void MyMethod(this object value, object arg1, object arg2)  {
    throw new NotImplementedException();
}

// Enter "xmethod3 [Tab]", then...  
public static void MyMethod(this object value, object arg1, object arg2, object arg3)  {
    throw new NotImplementedException();
}
```

### ex.6) Async instance method

```csharp
// Enter "amethod [Tab]", then...  
public async Task<object> MyMethodAsync()  {
    throw new NotImplementedException();
}
```

### ex.7) Async static method

```csharp
// Enter "asmethod [Tab]", then...  
public static async Task<object> MyMethodAsync()  {
    throw new NotImplementedException();
}
```

### ex.8) Event handler, Static event handler

```csharp
// Enter "eh [Tab]", then... 
private void MyMethod(object sender, EventArgs e)
{
    throw new NotImplementedException();
}
```

```csharp
// Enter "seh [Tab]", then... 
private static void MyMethod(object sender, EventArgs e)
{
    throw new NotImplementedException();
}
```

## License

[GNU GPL v.3](LICENSE.txt)
