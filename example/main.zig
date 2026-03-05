const std = @import("std");
const trigo = @import("trigo-zig");

pub fn main() void {
    const pi = std.math.pi;
    std.debug.print("sin(pi/2) = {d}\n", .{trigo.sin(pi / 2.0)});
    std.debug.print("cos(0)    = {d}\n", .{trigo.cos(0.0)});
    std.debug.print("tan(pi/4) = {d}\n", .{trigo.tan(pi / 4.0)});
    std.debug.print("cot(pi/4) = {d}\n", .{trigo.cot(pi / 4.0)});
}
