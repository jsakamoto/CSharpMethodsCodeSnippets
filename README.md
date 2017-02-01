# C# Methods Code Snippets - for Visual Studio

## Summary

This is code snippets for appending method in C# code, for Visual Studio 2012 or above.

## How to install?

Download "C# Methods Code Snippets" Visual Studio Extension file (.vsix) from [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=jsakamoto.CMethodsCodeSnippets), and open it.

You can also install via Visual Studio [Tools] > [Extensions and Updates] dialog (search with keyword "method").

![fig.1](.assets/fig001.png)

## How to use?

After installing of this snippet, you can use following code snippet shortcuts.

- **method** (snippet for instance method)
- **vmethod** (snippet for virtual instance method)
- **smethod** (snippet for static method)
- **xmethod** (snippet for extension method)

```csharp
// Enter "method [Tab]", then...  
public void MyMethod()  {
    throw new NotImplementedException();
}
```

```csharp
// Enter "vmethod [Tab]", then...  
public virtual void MyMethod()  {
    throw new NotImplementedException();
}
```

```csharp
// Enter "smethod [Tab]", then...  
public static void MyMethod()  {
    throw new NotImplementedException();
}
```

```csharp
// Enter "xmethod [Tab]", then...  
public static void MyMethod(this object value)  {
    throw new NotImplementedException();
}
```

## License

[GNU GPL v.3](LICENSE)
