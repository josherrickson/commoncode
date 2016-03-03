input Y    upper   lower   X
10         12      8       1
20         22      14      2
30         37      22      3
40         42      33      4
50         53      48      5
end

// Vertical CI's
twoway rcap upper lower type || scatter Y type

// Horizontal CI's
twoway rcap upper lower type, horizontal || scatter type Y
// with horizontal, Y's and X's reverse, so notice reverse in scatter.

// Also rspike (no caps), rline, rarea.