# My Neovim Config

## LSP Servers

I have chosen not to use mason or other in-editor tools to automatically install LSP Servers.
My preference is to use package managers to install those...at least for now.


### C#

I am using [csharp-language-server](https://github.com/razzmatazz/csharp-language-server).
To install (all platforms, requires dotnet 10):

    dotnet tool install --global csharp-ls


### LUA

This configuration uses [lua-language-server](https://github.com/LuaLS/lua-language-server).
To install:

    # On Mac:
    brew install lua-language-server

    # On Ubuntu:
    # TBD

    # On Windows
    # TBD


### Python

For a Python project, I use both `pyright` and `ruff`, and I expect the virtual environment will contain both of these packages.
This means that before I start the editors, I need to activate the virtual environment.


### Terraform

For terraform files, I am trying out [terraform-ls](https://github.com/hashicorp/terraform-ls/), the "official" language server by hashicorp.
To install:

    # On Mac:
    brew install hashicorp/tap/terraform-ls


### Swift

This configuration uses [SourceKit-LSP](https://github.com/apple/swift-sourcekit-lsp),
which is included with Xcode and the Xcode Command Line Tools. The Neovim config
starts it through `xcrun`, so it follows the currently selected developer
directory.

To install the required Apple tooling:

    xcode-select --install

If Xcode is installed but is not the selected developer directory:

    sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer

Verify that the server is available:

    xcrun --find sourcekit-lsp

For an Xcode project (`.xcodeproj` or `.xcworkspace`), SourceKit-LSP also
needs a Build Server Protocol bridge to discover the target's source files and
compiler settings. Install one with Homebrew:

    brew install xcode-build-server

Then, from the project root, generate `buildServer.json` for the project and
scheme:

    xcode-build-server config -project SwiftCalc.xcodeproj -scheme SwiftCalc

Build the project once with Xcode or `xcodebuild` to provide current compiler
settings, restart Neovim, and run the config command again if the project
settings change. Keep `buildServer.json` local to each checkout; it contains
machine-specific paths and should not be committed.

If the project builds with a custom `-derivedDataPath`, make the build server
use that same path. For example:

For current `xcode-build-server` releases, pass the generated workspace
explicitly when using `--build_root`, so `buildServer.json` retains its
`workspace` entry:

    xcode-build-server config --build_root "$PWD/build" -workspace SwiftCalc.xcodeproj/project.xcworkspace -scheme SwiftCalc

Alternatively, build without `-derivedDataPath` so Xcode and the build server
use the default DerivedData location.

When using a custom build directory, populate the compile database after a
clean verbose build:

    xcodebuild -verbose -project SwiftCalc.xcodeproj -scheme SwiftCalc -configuration Debug -derivedDataPath build clean build 2>&1 | xcode-build-server parse -o .compile

The generated `.compile` and `buildServer.json` files are local machine state;
add them to the project's `.gitignore`.
