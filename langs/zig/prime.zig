const std = @import("std");

var a: std.mem.Allocator = undefined;

fn sieve(size: usize) !std.DynamicBitSet {
    var sieve_array = try std.DynamicBitSet.initFull(a, size);
    {
        var i: usize = 0;
        while (i < @minimum(2, size)) : (i += 1) {
            sieve_array.unset(i);
        }
    }

    const root = @floatToInt(usize, @sqrt(@intToFloat(f64, size))) + 1;
    var i: usize = 2;
    while (i < root) : (i += 1) {
        if (sieve_array.isSet(i)) {
            var j = i * i;
            while (j < size) : (j += i) {
                sieve_array.unset(j);
            }
        }
    }

    return sieve_array;
}

fn count_prime(n: usize) !usize {
    return (try sieve(n + 1)).count();
}

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    a = arena.allocator();

    var arg_it = try std.process.argsWithAllocator(a);
    _ = arg_it.skip();

    var n: usize = 10000000;
    if (arg_it.next()) |s| {
        n = try std.fmt.parseInt(usize, s, 10);
    }

    const stdout = std.io.getStdOut().writer();
    try stdout.print("{}\n", .{count_prime(n)});
}
