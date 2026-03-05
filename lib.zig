const std = @import("std");

/// A simple implementation of sine and cosine functions using Taylor series expansion.
fn normalizeAngle(a: f64) f64 {
    const tau = std.math.tau;

    var angle = @mod(a, tau);
    if (angle > std.math.pi) {
        angle -= tau;
    } else if (angle < -std.math.pi) {
        angle += tau;
    }
    return angle;
}

pub fn sin(value: f64) f64 {
    const normalizedValue = normalizeAngle(value);

    var result: f64 = 0;
    var term: f64 = normalizedValue;
    var n: f64 = 1;

    var i: usize = 0;
    while (i < 10) : (i += 1) {
        result += term;
        n += 2.0;
        term *= -1.0 * normalizedValue * normalizedValue / ((n - 1.0) * n);
    }
    return result;
}

pub fn cos(value: f64) f64 {
    const normalizedValue = normalizeAngle(value);

    var result: f64 = 0;
    var term: f64 = 1;
    var n: f64 = 0;

    var i: usize = 0;
    while (i < 10) : (i += 1) {
        result += term;
        n += 2.0;
        term *= -1.0 * normalizedValue * normalizedValue / ((n - 1.0) * n);
    }
    return result;
}

pub fn tan(value: f64) f64 {
    return sin(value) / cos(value);
}

pub fn cot(value: f64) f64 {
    return cos(value) / sin(value);
}

test {
    const pi = std.math.pi;

    try std.testing.expectApproxEqAbs(cos(0.0), 1.0, 0.001);
    try std.testing.expectApproxEqAbs(cos(pi / 2.0), 0.0, 0.001);
    try std.testing.expectApproxEqAbs(cos(pi), -1.0, 0.001);

    try std.testing.expectApproxEqAbs(sin(0.0), 0.0, 0.001);
    try std.testing.expectApproxEqAbs(sin(pi / 2.0), 1.0, 0.001);
    try std.testing.expectApproxEqAbs(sin(pi), 0.0, 0.001);

    try std.testing.expectApproxEqAbs(tan(0.0), 0.0, 0.001);
    try std.testing.expectApproxEqAbs(tan(pi / 4.0), 1.0, 0.001);

    try std.testing.expectApproxEqAbs(cot(pi / 4.0), 1.0, 0.001);
}
