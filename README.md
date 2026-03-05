# Trigo Zig

> This is a pointless repository created to discuss how to write and use packages in Zig.

## Overivew

This package contains some trigonometric functions implemented in Zig. The main purpose of this repository is to demonstrate how to create a Zig package, write tests for it, and use it in other projects.

## Usage

To use this package in your Zig project, first save it as a local package.

```bash
zig fetch --save https://github.com/buraksenyurt/trigo-zig/archive/refs/tags/alpha.tar.gz

# or for Windows users:
zig fetch --save https://github.com/buraksenyurt/trigo-zig/archive/refs/tags/alpha.zip
```

This will download the package and save it in your `zig-cache` directory and also add dependency in you build.zig.zon file like this:

```zig
    .dependencies = .{
    .trigo_zig = .{
        .url = "https://github.com/buraksenyurt/trigo-zig/archive/refs/tags/alpha.zip",
        .hash = "trigo_zig-0.0.1-4.......",
    },
}
```

After that you need to add the package as a dependency in your `build.zig` file like this:

```zig
exe.root_module.addImport("trigo-zig", trigoZig.module("trigo-zig"));
```

There is a sample usage in the [example](./example) directory. You can run it with:

```bash
zig build run
```
