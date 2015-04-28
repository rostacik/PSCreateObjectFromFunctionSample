# PowerShell - Create Object From Function Sample

Small sample project , how to create custom object from PowerShell function in "class like" style.


## Why this sample

I needed simple and short solution for creating custom DTO objects with simple logic for later reuse elsewhere. Function essentialy takes "constructor" argument and returns object with properties that have getters with small piece of logic and are using constructor parameter. No inheritance, no access modificators or any advanced OOP stuff. Just above mentioned functionality as "helper". There are many other way of creating object in PowerShell (that also vary from PowerShell version to version - I used v4 here), but I needed something I can have in a function to call several times in a loop and create array of these objects.

## Usage

Just call the function and assign the output to the variable of your choice.

```powershell
$yourVar = getMeMyObject -propertyName 'qqqq'
```

I strongly typed variable -propertyName so it has to be string, but it's just for purpose of this demo, feel free to modify this snippet as you like/need.

There is only one small thing worth notice, the "secret" why at runtime we can access the input variable -propertyName is quite simple. I am calling 

```powershell
.GetNewClosure()
```

after each getter code, which is capturing all the variables. Without this the property 

```powershell
$propertyName
```

would be empty but code will not fail which is quite tricky I would say. You can try for your self :)

More on this method here :
[http://blogs.msdn.com/b/powershell/archive/2009/03/27/get-closure-with-getnewclosure.aspx](http://blogs.msdn.com/b/powershell/archive/2009/03/27/get-closure-with-getnewclosure.aspx "GetNewClosure").

## Two possible versions of calling

You can use two methods of calling the code. Either use dedicated .ps1 file with function in it, or inline copy a script block that creates variable you can call, choice is yours.

Enjoy.