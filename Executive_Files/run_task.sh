#!/bin/bash

# Function to check if a command exists on your PC's Enviroment.
has_command() {
    command -v "$1" >/dev/null 2>&1
}

#-----------Java------------------- 
if has_command javac && has_command java; 
	then
    echo "======Executing Java code======"
    javac Task.java && java Task  
	echo
	echo
else
    echo "Java is not installed on your PC."
fi

#--------- Node.js--------------
if has_command node;
	then
    echo "======Executing Node.js code:======"
    node -e "console.log('Itransition');"
	echo
	echo
else
    echo "Node.js is not installed on your PC."
fi

#-----------C#-------------------
if has_command dotnet; then
    echo "======Executing C# code:======"
    # Create a temporary .csproj file to run the C# code
    cat <<EOL > Task.csproj
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>net6.0</TargetFramework>
    <AllowUnsafeBlocks>true</AllowUnsafeBlocks>
  </PropertyGroup>
  <ItemGroup>
    <Compile Include="Task.java" />
  </ItemGroup>
</Project>
EOL
    cat <<EOL > Task.cs
using System;

public class Task {
    public static void Main(string[] args) {
        Console.WriteLine("Itransition");
    }
}
EOL
    dotnet run --project Task.csproj
    rm Task.csproj Task.cs
    echo
	echo
else
    echo "dotnet is not installed on your PC."
fi

