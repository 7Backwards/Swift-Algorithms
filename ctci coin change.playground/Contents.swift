//https://www.hackerrank.com/challenges/ctci-coin-change/problem

func stepPerms(n: Int) -> Int {
    if n == 0 { return 1 }
    if n == 1 { return 1 }
    if n == 2 { return 2 }
    
    var dp = [Int](repeating: 0, count: n + 1)
    
    // Initialize base cases
    dp[0] = 1
    dp[1] = 1
    dp[2] = 2
    
    // Compute values for dp[3] to dp[n]
    for i in 3...n {
        
        dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
        print("dp[\(i)] \(dp[i])")
    }
    
    return dp[n]
}

stepPerms(n: 4)
