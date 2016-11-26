---
layout: docsPage
title: Setup
order: 0
---

# Dependencies
* Arma 3
* CBA_A3

# Addons

## Prerequisites
{: .no-margin}
Mars follows the same build process and guidelines as the [ACE3](http://ace3mod.com/) project. Make sure you've read through their [documentation](http://ace3mod.com/wiki/development/) and setup your `P` drive accordingly.

## Writing Addons
Writing addons for Mars should be fairly simple as long as you're following the guidelines linked above. If your addon depends on another mod that isn't listed in the above dependencies then make sure you place it in the `optionals` folder.

# Extensions

## Prerequisites
{: .no-margin}
In order to write extensions for Mars you'll first off want the Intercept source code.

1. Navigate to `\tools\` inside the Mars root directory
2. Open up command prompt in this folder (*Shift+Right-Click > Open command window here*)
3. Type `git clone https://github.com/intercept/intercept.git`
4. Follow the [build steps for Intercept](https://github.com/intercept/intercept/wiki/Building-and-installing-Intercept-from-source#build-intercept-core-project-windows)
5. Open the `Intercept.sln` solution file in Visual Studio and then build the solution
6. Once Intercept has been built, close Visual Studio and navigate to `\extensions\` in the Mars root directory
7. Create your extension folder and files with the appropriate `CMakeLists.txt` configuration (copy it from another extension and just rename `MARS_EXTENSION_NAME` at the top)
8. Run CMake with the source directory as `\extensions\` and the build directory as `\vcproj\`
9. Open the `MARS.sln` solution file in Visual Studio and start coding!

## Using Intercept
Intercept should already be linked in your extension as well as the various include directories. You can simply include the Intercept header and start writing! It's important to note however that Intercept is still quite experimental and should only be used when performance is critical.

```c++
#include <Windows.h>
#include <stdio.h>
#include <cstdint>
#include <atomic>

#include "intercept.hpp"

using namespace intercept;

int __cdecl intercept::api_version() {
    return 1;
}

void __cdecl intercept::post_init() {
    // Post init code
}
```