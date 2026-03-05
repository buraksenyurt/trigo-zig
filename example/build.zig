const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const trigoZig = b.dependency("trigo_zig", .{
        .target = target,
        .optimize = optimize,
    });

    const exe = b.addExecutable(.{
        .name = "ZigStudent",
        .root_source_file = b.path("main.zig"),
        .target = target,
        .optimize = optimize,
    });

    exe.root_module.addImport("trigo-zig", trigoZig.module("trigo-zig"));

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
