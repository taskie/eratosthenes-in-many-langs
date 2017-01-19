#import <Cocoa/Cocoa.h>

NSMutableArray* sieve(int size) {
    if (size <= 0) return [@[] mutableCopy];
    if (size == 1) return [@[@NO] mutableCopy];
    NSMutableArray* sieveArray = [NSMutableArray arrayWithCapacity:size];
    for (int i = 0; i < 2; i++) [sieveArray addObject:@NO];
    for (int i = 2; i < size; i++) [sieveArray addObject:@YES];
    int root = sqrt(size) + 1;
    for (int i = 2; i < root; ++i) {
        if (![sieveArray[i] boolValue]) continue;
        for (int j = i * i; j < [sieveArray count]; j += i) {
            sieveArray[j] = @NO;
        }
    }
    return sieveArray;
}

int countPrime(int n) {
    int count = 0;
    for (NSNumber* p in sieve(n + 1)) {
        if ([p boolValue]) ++count;
    }
    return count;
}

int main(int argc, char* argv[]) {
    int n = 10000000;
    if (argc >= 2) {
        n = [[NSString stringWithCString:argv[1]
                                encoding:NSUTF8StringEncoding] intValue];
    }
    printf("%d\n", countPrime(n));
}
