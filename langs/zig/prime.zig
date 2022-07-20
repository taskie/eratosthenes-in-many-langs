const std = @import("std");

var a: std.mem.Allocator = undefined;

fn sieve(size: usize) ![]bool {
    const sieve_array: []bool = try a.alloc(bool, size);
    {
        var i: usize = 2;
        while (i < size) : (i += 1) {
            sieve_array[i] = true;
        }
    }

    const root = @floatToInt(usize, @sqrt(@intToFloat(f64, size))) + 1;
    var i: usize = 2;
    while (i < root) : (i += 1) {
        if (sieve_array[i]) {
            var j = i * i;
            while (j < size) {
                sieve_array[j] = false;
                j += i;
            }
        }
    }

    return sieve_array;
}

fn count_prime(n: usize) !usize {
    var count: usize = 0;
    for (try sieve(n + 1)) |b| {
        if (b) {
            count += 1;
        }
    }
    return count;
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
