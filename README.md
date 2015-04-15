# PowerShell - Create Object From Function Sample
---

Small sample project , how to create custom object from PowerShell function in "class like" style.


## Why this sample

I needed simple and short solution for creating custom DTO objects with simple logic for later reuse elsewhere. Function essentialy takes "constructor" argument and returns object with properties that have getters and are using constructor parameter. No inheritance, no access modificators, etc. Just above mentioned functionality as "helper". There are many other way of creating object, but I needed something I can have in a function to call several times in a loop and create array of these thing.

## Usage

Just call the function and assign the output to the variable of your choice.

```powershell
$yourVar = getMeMyObject -propertyName 'qqqq'
```

I strongly typed variable -propertyName so it has to be string, but it's just for this demo, fee free to modify this snippet as you like/need.

### The secret (why at runtime we can access the input variable -propertyName)

Is quite simple, I am calling 

```powershell
.GetNewClosure()
```

which is capturing all the variables. Without this the property 

```powershell
$propertyName
```

would be empty but code will not fail which is quite tricky I would say. You can try for your self :)

Enjoy.