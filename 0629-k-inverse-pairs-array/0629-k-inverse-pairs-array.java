class Solution {
    public int kInversePairs(int n, int k) {
        int M = 1000000007;
        int[] prevDp = new int[k + 1];
        int[] currDp = new int[k + 1];
        // For any N the only array with zero inverse pairs - is naturally ordered array. 
        prevDp[0] = 1;
        currDp[0] = 1;

        for (int i = 1; i < n; i++) { // iterate n - 1 times, and as well i represents a length of nums array on the previous step
            int sum = currDp[0];
            for (int j = 1; j < currDp.length; j++) {
                // add count from previous step for the same amount of pairs
                sum = (sum + prevDp[j]) % M;
                // don't need to get all counts from previous step, just only ones which can reach current j (amount of pairs), 
                // so remove this 'tail' count from the sum 
                // e.g. j = 15 (amount of pairs), prev step nums count = 10, 
                // so we need  to start from j = 5, hence prevDp[9] should be removed from sum
                if (j - i - 1 >= 0) {
                    sum = (sum - prevDp[j - i - 1]) % M;
                }
                if (sum < 0) {
                    sum += M;
                }
                currDp[j] = sum;
            }
            int[] temp = prevDp;
            prevDp = currDp;
            currDp = temp;
        }
        return prevDp[k] % M;
    }
}