* This file was automatically generated by Zimpl
* param Q2 := 1;
* param M := 1000;
* do print file2;
* param nC := read file1 as "1n" use 1;
* param nN := read file1 as "2n" use 1;
* param m  := read file1 as "3n" use 1;
* param nT := read file1 as "4n" use 1;
* param nP := read file2 as "1n" use 1;
* set C := { 1 .. nC };
* set N := { 1 .. nN };
* set T0 := { 0 .. nT };
* set T := { 1 .. nT };
* set P := { 1 .. nP };
* param inveCost[N] := read file1 as "<1n> 2n" skip 1 use nN;
* param backCost[N] := read file1 as "<1n> 2n" skip nN+1 use nN;
* param demand[C*N*T] := read file1 as "<1n,2n,3n> 4n" skip 2*nN+1;
* param q[P*N] := read file2 as "<1n,2n> 3n" skip 1;
* param D[<c,i> in C*N] := ceil( sum <t> in T : demand[c,i,t]/Q2 );
* set Pc[<c> in C] := inter <i> in { <i> in N with ( sum <t> in T : demand[c,i,t] ) > 0 } : { <j> in P with q[j,i] > 0 };
* var B[C*N*T0] >= 0;
* var I[C*N*T0] >= 0;
* var f[C*N*T] integer >= 0;
* var y[C*P*T] integer >= 0;
* var p[P] binary;
* minimize cost: sum <i> in N: ( sum <t> in T: (sum <c> in C : (inveCost[i] * I[c,i,t]  + backCost[i] * B[c,i,t]) ));
* subto select:       sum <j> in P: p[j] <= m;
* subto balance:    forall <c,i,t> in C*N*T with t>=1 do       I[c,i,t-1] - B[c,i,t-1] + Q1*Q2*f[c,i,t] + Q2 * (sum <j> in Pc[c
* ]: q[j,i] * y[c,j,t]) == demand[c,i,t] + I[c,i,t] - B[c,i,t];
* subto valid:    forall <c,i> in C*N do       sum <t> in T: ( min(Q1, D[c,i]) * f[c,i,t] + sum <j> in Pc[c]: ( min(q[j,i], D[c
* ,i] ) * y[c,j,t]) ) >= D[c,i];
* subto BigM:    forall <c,j,t> in C*P*T with t>=1 do       y[c,j,t] <= M*p[j];
* subto init1:    forall <c,i> in C*N do       I[c,i,0] == 0;
* subto init2:    forall <c,i> in C*N do       B[c,i,0] == 0;
* subto init3:    forall <c,i> in C*N do       B[c,i,nT] == 0;
NAME          mpdp.zpl
ROWS
 N  OBJECTIV          
 L  select_1          
 E  balanc@1          
 E  balanc@2          
 E  balanc@3          
 E  balanc@4          
 E  balanc@5          
 E  balanc@6          
 E  balanc@7          
 E  balanc@8          
 E  balanc@9          
 E  balanc@a          
 E  balanc@b          
 E  balanc@c          
 E  balanc@d          
 E  balanc@e          
 E  balanc@f          
 E  balan@10          
 E  balan@11          
 E  balan@12          
 E  balan@13          
 E  balan@14          
 E  balan@15          
 E  balan@16          
 E  balan@17          
 E  balan@18          
 G  valid_1           
 G  valid_2           
 G  valid_3           
 G  valid_4           
 G  valid_5           
 L  BigM_1            
 L  BigM_2            
 L  BigM_3            
 L  BigM_4            
 L  BigM_5            
 L  BigM_6            
 L  BigM_7            
 L  BigM_8            
 L  BigM_9            
 L  BigM_10           
 L  BigM_11           
 L  BigM_12           
 L  BigM_13           
 L  BigM_14           
 L  BigM_15           
 L  BigM_16           
 L  BigM_17           
 L  BigM_18           
 L  BigM_19           
 L  BigM_20           
 L  BigM_21           
 L  BigM_22           
 L  BigM_23           
 L  BigM_24           
 L  BigM_25           
 L  BigM_26           
 L  BigM_27           
 L  BigM_28           
 L  BigM_29           
 L  BigM_30           
 L  BigM_31           
 L  BigM_32           
 L  BigM_33           
 L  BigM_34           
 L  BigM_35           
 L  BigM_36           
 L  BigM_37           
 L  BigM_38           
 L  BigM_39           
 L  BigM_40           
 L  BigM_41           
 L  BigM_42           
 L  BigM_43           
 L  BigM_44           
 L  BigM_45           
 L  BigM_46           
 L  BigM_47           
 L  BigM_48           
 L  BigM_49           
 L  BigM_50           
 L  BigM_51           
 L  BigM_52           
 L  BigM_53           
 L  BigM_54           
 L  BigM_55           
 L  BigM_56           
 L  BigM_57           
 L  BigM_58           
 L  BigM_59           
 L  BigM_60           
 L  BigM_61           
 L  BigM_62           
 L  BigM_63           
 L  BigM_64           
 L  BigM_65           
 L  BigM_66           
 L  BigM_67           
 L  BigM_68           
 L  BigM_69           
 L  BigM_70           
 L  BigM_71           
 L  BigM_72           
 E  init1_1           
 E  init1_2           
 E  init1_3           
 E  init1_4           
 E  init1_5           
 E  init1_6           
 E  init2_1           
 E  init2_2           
 E  init2_3           
 E  init2_4           
 E  init2_5           
 E  init2_6           
 E  init3_1           
 E  init3_2           
 E  init3_3           
 E  init3_4           
 E  init3_5           
 E  init3_6           
COLUMNS
    MARK0000  'MARKER'                 'INTORG'
    f#1#1#1   valid_1             72
    f#1#1#1   balanc@1            72
    f#1#1#2   valid_1             72
    f#1#1#2   balanc@2            72
    f#1#1#3   valid_1             72
    f#1#1#3   balanc@3            72
    f#1#1#4   valid_1             72
    f#1#1#4   balanc@4            72
    f#1#2#1   balanc@5            72
    f#1#2#2   balanc@6            72
    f#1#2#3   balanc@7            72
    f#1#2#4   balanc@8            72
    f#2#1#1   valid_2             72
    f#2#1#1   balanc@9            72
    f#2#1#2   valid_2             72
    f#2#1#2   balanc@a            72
    f#2#1#3   valid_2             72
    f#2#1#3   balanc@b            72
    f#2#1#4   valid_2             72
    f#2#1#4   balanc@c            72
    f#2#2#1   valid_3             72
    f#2#2#1   balanc@d            72
    f#2#2#2   valid_3             72
    f#2#2#2   balanc@e            72
    f#2#2#3   valid_3             72
    f#2#2#3   balanc@f            72
    f#2#2#4   valid_3             72
    f#2#2#4   balan@10            72
    f#3#1#1   valid_4             72
    f#3#1#1   balan@11            72
    f#3#1#2   valid_4             72
    f#3#1#2   balan@12            72
    f#3#1#3   valid_4             72
    f#3#1#3   balan@13            72
    f#3#1#4   valid_4             72
    f#3#1#4   balan@14            72
    f#3#2#1   valid_5             72
    f#3#2#1   balan@15            72
    f#3#2#2   valid_5             72
    f#3#2#2   balan@16            72
    f#3#2#3   valid_5             72
    f#3#2#3   balan@17            72
    f#3#2#4   valid_5             72
    f#3#2#4   balan@18            72
    y#1#1#1   BigM_1               1
    y#1#1#1   valid_1              7
    y#1#1#1   balanc@5            65
    y#1#1#1   balanc@1             7
    y#1#1#2   BigM_2               1
    y#1#1#2   valid_1              7
    y#1#1#2   balanc@6            65
    y#1#1#2   balanc@2             7
    y#1#1#3   BigM_3               1
    y#1#1#3   valid_1              7
    y#1#1#3   balanc@7            65
    y#1#1#3   balanc@3             7
    y#1#1#4   BigM_4               1
    y#1#1#4   valid_1              7
    y#1#1#4   balanc@8            65
    y#1#1#4   balanc@4             7
    y#1#2#1   BigM_5               1
    y#1#2#1   valid_1             17
    y#1#2#1   balanc@5            55
    y#1#2#1   balanc@1            17
    y#1#2#2   BigM_6               1
    y#1#2#2   valid_1             17
    y#1#2#2   balanc@6            55
    y#1#2#2   balanc@2            17
    y#1#2#3   BigM_7               1
    y#1#2#3   valid_1             17
    y#1#2#3   balanc@7            55
    y#1#2#3   balanc@3            17
    y#1#2#4   BigM_8               1
    y#1#2#4   valid_1             17
    y#1#2#4   balanc@8            55
    y#1#2#4   balanc@4            17
    y#1#3#1   BigM_9               1
    y#1#3#1   valid_1             45
    y#1#3#1   balanc@5            27
    y#1#3#1   balanc@1            45
    y#1#3#2   BigM_10              1
    y#1#3#2   valid_1             45
    y#1#3#2   balanc@6            27
    y#1#3#2   balanc@2            45
    y#1#3#3   BigM_11              1
    y#1#3#3   valid_1             45
    y#1#3#3   balanc@7            27
    y#1#3#3   balanc@3            45
    y#1#3#4   BigM_12              1
    y#1#3#4   valid_1             45
    y#1#3#4   balanc@8            27
    y#1#3#4   balanc@4            45
    y#1#4#1   BigM_13              1
    y#1#4#1   valid_1             58
    y#1#4#1   balanc@5            14
    y#1#4#1   balanc@1            58
    y#1#4#2   BigM_14              1
    y#1#4#2   valid_1             58
    y#1#4#2   balanc@6            14
    y#1#4#2   balanc@2            58
    y#1#4#3   BigM_15              1
    y#1#4#3   valid_1             58
    y#1#4#3   balanc@7            14
    y#1#4#3   balanc@3            58
    y#1#4#4   BigM_16              1
    y#1#4#4   valid_1             58
    y#1#4#4   balanc@8            14
    y#1#4#4   balanc@4            58
    y#1#5#1   BigM_17              1
    y#1#5#1   valid_1             30
    y#1#5#1   balanc@5            42
    y#1#5#1   balanc@1            30
    y#1#5#2   BigM_18              1
    y#1#5#2   valid_1             30
    y#1#5#2   balanc@6            42
    y#1#5#2   balanc@2            30
    y#1#5#3   BigM_19              1
    y#1#5#3   valid_1             30
    y#1#5#3   balanc@7            42
    y#1#5#3   balanc@3            30
    y#1#5#4   BigM_20              1
    y#1#5#4   valid_1             30
    y#1#5#4   balanc@8            42
    y#1#5#4   balanc@4            30
    y#1#6#1   BigM_21              1
    y#1#6#1   valid_1             15
    y#1#6#1   balanc@5            57
    y#1#6#1   balanc@1            15
    y#1#6#2   BigM_22              1
    y#1#6#2   valid_1             15
    y#1#6#2   balanc@6            57
    y#1#6#2   balanc@2            15
    y#1#6#3   BigM_23              1
    y#1#6#3   valid_1             15
    y#1#6#3   balanc@7            57
    y#1#6#3   balanc@3            15
    y#1#6#4   BigM_24              1
    y#1#6#4   valid_1             15
    y#1#6#4   balanc@8            57
    y#1#6#4   balanc@4            15
    y#2#1#1   BigM_25              1
    y#2#1#1   valid_3             65
    y#2#1#1   valid_2              7
    y#2#1#1   balanc@d            65
    y#2#1#1   balanc@9             7
    y#2#1#2   BigM_26              1
    y#2#1#2   valid_3             65
    y#2#1#2   valid_2              7
    y#2#1#2   balanc@e            65
    y#2#1#2   balanc@a             7
    y#2#1#3   BigM_27              1
    y#2#1#3   valid_3             65
    y#2#1#3   valid_2              7
    y#2#1#3   balanc@f            65
    y#2#1#3   balanc@b             7
    y#2#1#4   BigM_28              1
    y#2#1#4   valid_3             65
    y#2#1#4   valid_2              7
    y#2#1#4   balan@10            65
    y#2#1#4   balanc@c             7
    y#2#2#1   BigM_29              1
    y#2#2#1   valid_3             55
    y#2#2#1   valid_2             17
    y#2#2#1   balanc@d            55
    y#2#2#1   balanc@9            17
    y#2#2#2   BigM_30              1
    y#2#2#2   valid_3             55
    y#2#2#2   valid_2             17
    y#2#2#2   balanc@e            55
    y#2#2#2   balanc@a            17
    y#2#2#3   BigM_31              1
    y#2#2#3   valid_3             55
    y#2#2#3   valid_2             17
    y#2#2#3   balanc@f            55
    y#2#2#3   balanc@b            17
    y#2#2#4   BigM_32              1
    y#2#2#4   valid_3             55
    y#2#2#4   valid_2             17
    y#2#2#4   balan@10            55
    y#2#2#4   balanc@c            17
    y#2#3#1   BigM_33              1
    y#2#3#1   valid_3             27
    y#2#3#1   valid_2             45
    y#2#3#1   balanc@d            27
    y#2#3#1   balanc@9            45
    y#2#3#2   BigM_34              1
    y#2#3#2   valid_3             27
    y#2#3#2   valid_2             45
    y#2#3#2   balanc@e            27
    y#2#3#2   balanc@a            45
    y#2#3#3   BigM_35              1
    y#2#3#3   valid_3             27
    y#2#3#3   valid_2             45
    y#2#3#3   balanc@f            27
    y#2#3#3   balanc@b            45
    y#2#3#4   BigM_36              1
    y#2#3#4   valid_3             27
    y#2#3#4   valid_2             45
    y#2#3#4   balan@10            27
    y#2#3#4   balanc@c            45
    y#2#4#1   BigM_37              1
    y#2#4#1   valid_3             14
    y#2#4#1   valid_2             58
    y#2#4#1   balanc@d            14
    y#2#4#1   balanc@9            58
    y#2#4#2   BigM_38              1
    y#2#4#2   valid_3             14
    y#2#4#2   valid_2             58
    y#2#4#2   balanc@e            14
    y#2#4#2   balanc@a            58
    y#2#4#3   BigM_39              1
    y#2#4#3   valid_3             14
    y#2#4#3   valid_2             58
    y#2#4#3   balanc@f            14
    y#2#4#3   balanc@b            58
    y#2#4#4   BigM_40              1
    y#2#4#4   valid_3             14
    y#2#4#4   valid_2             58
    y#2#4#4   balan@10            14
    y#2#4#4   balanc@c            58
    y#2#5#1   BigM_41              1
    y#2#5#1   valid_3             42
    y#2#5#1   valid_2             30
    y#2#5#1   balanc@d            42
    y#2#5#1   balanc@9            30
    y#2#5#2   BigM_42              1
    y#2#5#2   valid_3             42
    y#2#5#2   valid_2             30
    y#2#5#2   balanc@e            42
    y#2#5#2   balanc@a            30
    y#2#5#3   BigM_43              1
    y#2#5#3   valid_3             42
    y#2#5#3   valid_2             30
    y#2#5#3   balanc@f            42
    y#2#5#3   balanc@b            30
    y#2#5#4   BigM_44              1
    y#2#5#4   valid_3             42
    y#2#5#4   valid_2             30
    y#2#5#4   balan@10            42
    y#2#5#4   balanc@c            30
    y#2#6#1   BigM_45              1
    y#2#6#1   valid_3             57
    y#2#6#1   valid_2             15
    y#2#6#1   balanc@d            57
    y#2#6#1   balanc@9            15
    y#2#6#2   BigM_46              1
    y#2#6#2   valid_3             57
    y#2#6#2   valid_2             15
    y#2#6#2   balanc@e            57
    y#2#6#2   balanc@a            15
    y#2#6#3   BigM_47              1
    y#2#6#3   valid_3             57
    y#2#6#3   valid_2             15
    y#2#6#3   balanc@f            57
    y#2#6#3   balanc@b            15
    y#2#6#4   BigM_48              1
    y#2#6#4   valid_3             57
    y#2#6#4   valid_2             15
    y#2#6#4   balan@10            57
    y#2#6#4   balanc@c            15
    y#3#1#1   BigM_49              1
    y#3#1#1   valid_5             65
    y#3#1#1   valid_4              7
    y#3#1#1   balan@15            65
    y#3#1#1   balan@11             7
    y#3#1#2   BigM_50              1
    y#3#1#2   valid_5             65
    y#3#1#2   valid_4              7
    y#3#1#2   balan@16            65
    y#3#1#2   balan@12             7
    y#3#1#3   BigM_51              1
    y#3#1#3   valid_5             65
    y#3#1#3   valid_4              7
    y#3#1#3   balan@17            65
    y#3#1#3   balan@13             7
    y#3#1#4   BigM_52              1
    y#3#1#4   valid_5             65
    y#3#1#4   valid_4              7
    y#3#1#4   balan@18            65
    y#3#1#4   balan@14             7
    y#3#2#1   BigM_53              1
    y#3#2#1   valid_5             55
    y#3#2#1   valid_4             17
    y#3#2#1   balan@15            55
    y#3#2#1   balan@11            17
    y#3#2#2   BigM_54              1
    y#3#2#2   valid_5             55
    y#3#2#2   valid_4             17
    y#3#2#2   balan@16            55
    y#3#2#2   balan@12            17
    y#3#2#3   BigM_55              1
    y#3#2#3   valid_5             55
    y#3#2#3   valid_4             17
    y#3#2#3   balan@17            55
    y#3#2#3   balan@13            17
    y#3#2#4   BigM_56              1
    y#3#2#4   valid_5             55
    y#3#2#4   valid_4             17
    y#3#2#4   balan@18            55
    y#3#2#4   balan@14            17
    y#3#3#1   BigM_57              1
    y#3#3#1   valid_5             27
    y#3#3#1   valid_4             45
    y#3#3#1   balan@15            27
    y#3#3#1   balan@11            45
    y#3#3#2   BigM_58              1
    y#3#3#2   valid_5             27
    y#3#3#2   valid_4             45
    y#3#3#2   balan@16            27
    y#3#3#2   balan@12            45
    y#3#3#3   BigM_59              1
    y#3#3#3   valid_5             27
    y#3#3#3   valid_4             45
    y#3#3#3   balan@17            27
    y#3#3#3   balan@13            45
    y#3#3#4   BigM_60              1
    y#3#3#4   valid_5             27
    y#3#3#4   valid_4             45
    y#3#3#4   balan@18            27
    y#3#3#4   balan@14            45
    y#3#4#1   BigM_61              1
    y#3#4#1   valid_5             14
    y#3#4#1   valid_4             58
    y#3#4#1   balan@15            14
    y#3#4#1   balan@11            58
    y#3#4#2   BigM_62              1
    y#3#4#2   valid_5             14
    y#3#4#2   valid_4             58
    y#3#4#2   balan@16            14
    y#3#4#2   balan@12            58
    y#3#4#3   BigM_63              1
    y#3#4#3   valid_5             14
    y#3#4#3   valid_4             58
    y#3#4#3   balan@17            14
    y#3#4#3   balan@13            58
    y#3#4#4   BigM_64              1
    y#3#4#4   valid_5             14
    y#3#4#4   valid_4             58
    y#3#4#4   balan@18            14
    y#3#4#4   balan@14            58
    y#3#5#1   BigM_65              1
    y#3#5#1   valid_5             42
    y#3#5#1   valid_4             30
    y#3#5#1   balan@15            42
    y#3#5#1   balan@11            30
    y#3#5#2   BigM_66              1
    y#3#5#2   valid_5             42
    y#3#5#2   valid_4             30
    y#3#5#2   balan@16            42
    y#3#5#2   balan@12            30
    y#3#5#3   BigM_67              1
    y#3#5#3   valid_5             42
    y#3#5#3   valid_4             30
    y#3#5#3   balan@17            42
    y#3#5#3   balan@13            30
    y#3#5#4   BigM_68              1
    y#3#5#4   valid_5             42
    y#3#5#4   valid_4             30
    y#3#5#4   balan@18            42
    y#3#5#4   balan@14            30
    y#3#6#1   BigM_69              1
    y#3#6#1   valid_5             57
    y#3#6#1   valid_4             15
    y#3#6#1   balan@15            57
    y#3#6#1   balan@11            15
    y#3#6#2   BigM_70              1
    y#3#6#2   valid_5             57
    y#3#6#2   valid_4             15
    y#3#6#2   balan@16            57
    y#3#6#2   balan@12            15
    y#3#6#3   BigM_71              1
    y#3#6#3   valid_5             57
    y#3#6#3   valid_4             15
    y#3#6#3   balan@17            57
    y#3#6#3   balan@13            15
    y#3#6#4   BigM_72              1
    y#3#6#4   valid_5             57
    y#3#6#4   valid_4             15
    y#3#6#4   balan@18            57
    y#3#6#4   balan@14            15
    p#1       BigM_52          -1000
    p#1       BigM_51          -1000
    p#1       BigM_50          -1000
    p#1       BigM_49          -1000
    p#1       BigM_28          -1000
    p#1       BigM_27          -1000
    p#1       BigM_26          -1000
    p#1       BigM_25          -1000
    p#1       BigM_4           -1000
    p#1       BigM_3           -1000
    p#1       BigM_2           -1000
    p#1       BigM_1           -1000
    p#1       select_1             1
    p#2       BigM_56          -1000
    p#2       BigM_55          -1000
    p#2       BigM_54          -1000
    p#2       BigM_53          -1000
    p#2       BigM_32          -1000
    p#2       BigM_31          -1000
    p#2       BigM_30          -1000
    p#2       BigM_29          -1000
    p#2       BigM_8           -1000
    p#2       BigM_7           -1000
    p#2       BigM_6           -1000
    p#2       BigM_5           -1000
    p#2       select_1             1
    p#3       BigM_60          -1000
    p#3       BigM_59          -1000
    p#3       BigM_58          -1000
    p#3       BigM_57          -1000
    p#3       BigM_36          -1000
    p#3       BigM_35          -1000
    p#3       BigM_34          -1000
    p#3       BigM_33          -1000
    p#3       BigM_12          -1000
    p#3       BigM_11          -1000
    p#3       BigM_10          -1000
    p#3       BigM_9           -1000
    p#3       select_1             1
    p#4       BigM_64          -1000
    p#4       BigM_63          -1000
    p#4       BigM_62          -1000
    p#4       BigM_61          -1000
    p#4       BigM_40          -1000
    p#4       BigM_39          -1000
    p#4       BigM_38          -1000
    p#4       BigM_37          -1000
    p#4       BigM_16          -1000
    p#4       BigM_15          -1000
    p#4       BigM_14          -1000
    p#4       BigM_13          -1000
    p#4       select_1             1
    p#5       BigM_68          -1000
    p#5       BigM_67          -1000
    p#5       BigM_66          -1000
    p#5       BigM_65          -1000
    p#5       BigM_44          -1000
    p#5       BigM_43          -1000
    p#5       BigM_42          -1000
    p#5       BigM_41          -1000
    p#5       BigM_20          -1000
    p#5       BigM_19          -1000
    p#5       BigM_18          -1000
    p#5       BigM_17          -1000
    p#5       select_1             1
    p#6       BigM_72          -1000
    p#6       BigM_71          -1000
    p#6       BigM_70          -1000
    p#6       BigM_69          -1000
    p#6       BigM_48          -1000
    p#6       BigM_47          -1000
    p#6       BigM_46          -1000
    p#6       BigM_45          -1000
    p#6       BigM_24          -1000
    p#6       BigM_23          -1000
    p#6       BigM_22          -1000
    p#6       BigM_21          -1000
    p#6       select_1             1
    MARK0001  'MARKER'                 'INTEND'
    B#1#1#0   init2_1              1
    B#1#1#0   balanc@1            -1
    B#1#1#1   OBJECTIV             5
    B#1#1#1   balanc@2            -1
    B#1#1#1   balanc@1             1
    B#1#1#2   OBJECTIV             5
    B#1#1#2   balanc@3            -1
    B#1#1#2   balanc@2             1
    B#1#1#3   OBJECTIV             5
    B#1#1#3   balanc@4            -1
    B#1#1#3   balanc@3             1
    B#1#1#4   OBJECTIV             5
    B#1#1#4   init3_1              1
    B#1#1#4   balanc@4             1
    B#1#2#0   init2_2              1
    B#1#2#0   balanc@5            -1
    B#1#2#1   OBJECTIV           5.5
    B#1#2#1   balanc@6            -1
    B#1#2#1   balanc@5             1
    B#1#2#2   OBJECTIV           5.5
    B#1#2#2   balanc@7            -1
    B#1#2#2   balanc@6             1
    B#1#2#3   OBJECTIV           5.5
    B#1#2#3   balanc@8            -1
    B#1#2#3   balanc@7             1
    B#1#2#4   OBJECTIV           5.5
    B#1#2#4   init3_2              1
    B#1#2#4   balanc@8             1
    B#2#1#0   init2_3              1
    B#2#1#0   balanc@9            -1
    B#2#1#1   OBJECTIV             5
    B#2#1#1   balanc@a            -1
    B#2#1#1   balanc@9             1
    B#2#1#2   OBJECTIV             5
    B#2#1#2   balanc@b            -1
    B#2#1#2   balanc@a             1
    B#2#1#3   OBJECTIV             5
    B#2#1#3   balanc@c            -1
    B#2#1#3   balanc@b             1
    B#2#1#4   OBJECTIV             5
    B#2#1#4   init3_3              1
    B#2#1#4   balanc@c             1
    B#2#2#0   init2_4              1
    B#2#2#0   balanc@d            -1
    B#2#2#1   OBJECTIV           5.5
    B#2#2#1   balanc@e            -1
    B#2#2#1   balanc@d             1
    B#2#2#2   OBJECTIV           5.5
    B#2#2#2   balanc@f            -1
    B#2#2#2   balanc@e             1
    B#2#2#3   OBJECTIV           5.5
    B#2#2#3   balan@10            -1
    B#2#2#3   balanc@f             1
    B#2#2#4   OBJECTIV           5.5
    B#2#2#4   init3_4              1
    B#2#2#4   balan@10             1
    B#3#1#0   init2_5              1
    B#3#1#0   balan@11            -1
    B#3#1#1   OBJECTIV             5
    B#3#1#1   balan@12            -1
    B#3#1#1   balan@11             1
    B#3#1#2   OBJECTIV             5
    B#3#1#2   balan@13            -1
    B#3#1#2   balan@12             1
    B#3#1#3   OBJECTIV             5
    B#3#1#3   balan@14            -1
    B#3#1#3   balan@13             1
    B#3#1#4   OBJECTIV             5
    B#3#1#4   init3_5              1
    B#3#1#4   balan@14             1
    B#3#2#0   init2_6              1
    B#3#2#0   balan@15            -1
    B#3#2#1   OBJECTIV           5.5
    B#3#2#1   balan@16            -1
    B#3#2#1   balan@15             1
    B#3#2#2   OBJECTIV           5.5
    B#3#2#2   balan@17            -1
    B#3#2#2   balan@16             1
    B#3#2#3   OBJECTIV           5.5
    B#3#2#3   balan@18            -1
    B#3#2#3   balan@17             1
    B#3#2#4   OBJECTIV           5.5
    B#3#2#4   init3_6              1
    B#3#2#4   balan@18             1
    I#1#1#0   init1_1              1
    I#1#1#0   balanc@1             1
    I#1#1#1   OBJECTIV             1
    I#1#1#1   balanc@2             1
    I#1#1#1   balanc@1            -1
    I#1#1#2   OBJECTIV             1
    I#1#1#2   balanc@3             1
    I#1#1#2   balanc@2            -1
    I#1#1#3   OBJECTIV             1
    I#1#1#3   balanc@4             1
    I#1#1#3   balanc@3            -1
    I#1#1#4   OBJECTIV             1
    I#1#1#4   balanc@4            -1
    I#1#2#0   init1_2              1
    I#1#2#0   balanc@5             1
    I#1#2#1   OBJECTIV           1.1
    I#1#2#1   balanc@6             1
    I#1#2#1   balanc@5            -1
    I#1#2#2   OBJECTIV           1.1
    I#1#2#2   balanc@7             1
    I#1#2#2   balanc@6            -1
    I#1#2#3   OBJECTIV           1.1
    I#1#2#3   balanc@8             1
    I#1#2#3   balanc@7            -1
    I#1#2#4   OBJECTIV           1.1
    I#1#2#4   balanc@8            -1
    I#2#1#0   init1_3              1
    I#2#1#0   balanc@9             1
    I#2#1#1   OBJECTIV             1
    I#2#1#1   balanc@a             1
    I#2#1#1   balanc@9            -1
    I#2#1#2   OBJECTIV             1
    I#2#1#2   balanc@b             1
    I#2#1#2   balanc@a            -1
    I#2#1#3   OBJECTIV             1
    I#2#1#3   balanc@c             1
    I#2#1#3   balanc@b            -1
    I#2#1#4   OBJECTIV             1
    I#2#1#4   balanc@c            -1
    I#2#2#0   init1_4              1
    I#2#2#0   balanc@d             1
    I#2#2#1   OBJECTIV           1.1
    I#2#2#1   balanc@e             1
    I#2#2#1   balanc@d            -1
    I#2#2#2   OBJECTIV           1.1
    I#2#2#2   balanc@f             1
    I#2#2#2   balanc@e            -1
    I#2#2#3   OBJECTIV           1.1
    I#2#2#3   balan@10             1
    I#2#2#3   balanc@f            -1
    I#2#2#4   OBJECTIV           1.1
    I#2#2#4   balan@10            -1
    I#3#1#0   init1_5              1
    I#3#1#0   balan@11             1
    I#3#1#1   OBJECTIV             1
    I#3#1#1   balan@12             1
    I#3#1#1   balan@11            -1
    I#3#1#2   OBJECTIV             1
    I#3#1#2   balan@13             1
    I#3#1#2   balan@12            -1
    I#3#1#3   OBJECTIV             1
    I#3#1#3   balan@14             1
    I#3#1#3   balan@13            -1
    I#3#1#4   OBJECTIV             1
    I#3#1#4   balan@14            -1
    I#3#2#0   init1_6              1
    I#3#2#0   balan@15             1
    I#3#2#1   OBJECTIV           1.1
    I#3#2#1   balan@16             1
    I#3#2#1   balan@15            -1
    I#3#2#2   OBJECTIV           1.1
    I#3#2#2   balan@17             1
    I#3#2#2   balan@16            -1
    I#3#2#3   OBJECTIV           1.1
    I#3#2#3   balan@18             1
    I#3#2#3   balan@17            -1
    I#3#2#4   OBJECTIV           1.1
    I#3#2#4   balan@18            -1
RHS
    RHS       select_1             1
    RHS       balanc@1           964
    RHS       balanc@2            21
    RHS       balanc@3           337
    RHS       balanc@4           669
    RHS       balanc@9           333
    RHS       balanc@a           776
    RHS       balanc@b           466
    RHS       balanc@c           764
    RHS       balanc@d           239
    RHS       balanc@e           425
    RHS       balanc@f           220
    RHS       balan@10           452
    RHS       balan@11           136
    RHS       balan@12           621
    RHS       balan@13           192
    RHS       balan@14            74
    RHS       balan@15             7
    RHS       balan@16            27
    RHS       balan@17           934
    RHS       balan@18           620
    RHS       valid_1           1991
    RHS       valid_2           2339
    RHS       valid_3           1336
    RHS       valid_4           1023
    RHS       valid_5           1588
BOUNDS
 LO BOUND     B#1#1#0              0
 PL BOUND     B#1#1#0 
 LO BOUND     B#1#1#1              0
 PL BOUND     B#1#1#1 
 LO BOUND     B#1#1#2              0
 PL BOUND     B#1#1#2 
 LO BOUND     B#1#1#3              0
 PL BOUND     B#1#1#3 
 LO BOUND     B#1#1#4              0
 PL BOUND     B#1#1#4 
 LO BOUND     B#1#2#0              0
 PL BOUND     B#1#2#0 
 LO BOUND     B#1#2#1              0
 PL BOUND     B#1#2#1 
 LO BOUND     B#1#2#2              0
 PL BOUND     B#1#2#2 
 LO BOUND     B#1#2#3              0
 PL BOUND     B#1#2#3 
 LO BOUND     B#1#2#4              0
 PL BOUND     B#1#2#4 
 LO BOUND     B#2#1#0              0
 PL BOUND     B#2#1#0 
 LO BOUND     B#2#1#1              0
 PL BOUND     B#2#1#1 
 LO BOUND     B#2#1#2              0
 PL BOUND     B#2#1#2 
 LO BOUND     B#2#1#3              0
 PL BOUND     B#2#1#3 
 LO BOUND     B#2#1#4              0
 PL BOUND     B#2#1#4 
 LO BOUND     B#2#2#0              0
 PL BOUND     B#2#2#0 
 LO BOUND     B#2#2#1              0
 PL BOUND     B#2#2#1 
 LO BOUND     B#2#2#2              0
 PL BOUND     B#2#2#2 
 LO BOUND     B#2#2#3              0
 PL BOUND     B#2#2#3 
 LO BOUND     B#2#2#4              0
 PL BOUND     B#2#2#4 
 LO BOUND     B#3#1#0              0
 PL BOUND     B#3#1#0 
 LO BOUND     B#3#1#1              0
 PL BOUND     B#3#1#1 
 LO BOUND     B#3#1#2              0
 PL BOUND     B#3#1#2 
 LO BOUND     B#3#1#3              0
 PL BOUND     B#3#1#3 
 LO BOUND     B#3#1#4              0
 PL BOUND     B#3#1#4 
 LO BOUND     B#3#2#0              0
 PL BOUND     B#3#2#0 
 LO BOUND     B#3#2#1              0
 PL BOUND     B#3#2#1 
 LO BOUND     B#3#2#2              0
 PL BOUND     B#3#2#2 
 LO BOUND     B#3#2#3              0
 PL BOUND     B#3#2#3 
 LO BOUND     B#3#2#4              0
 PL BOUND     B#3#2#4 
 LO BOUND     I#1#1#0              0
 PL BOUND     I#1#1#0 
 LO BOUND     I#1#1#1              0
 PL BOUND     I#1#1#1 
 LO BOUND     I#1#1#2              0
 PL BOUND     I#1#1#2 
 LO BOUND     I#1#1#3              0
 PL BOUND     I#1#1#3 
 LO BOUND     I#1#1#4              0
 PL BOUND     I#1#1#4 
 LO BOUND     I#1#2#0              0
 PL BOUND     I#1#2#0 
 LO BOUND     I#1#2#1              0
 PL BOUND     I#1#2#1 
 LO BOUND     I#1#2#2              0
 PL BOUND     I#1#2#2 
 LO BOUND     I#1#2#3              0
 PL BOUND     I#1#2#3 
 LO BOUND     I#1#2#4              0
 PL BOUND     I#1#2#4 
 LO BOUND     I#2#1#0              0
 PL BOUND     I#2#1#0 
 LO BOUND     I#2#1#1              0
 PL BOUND     I#2#1#1 
 LO BOUND     I#2#1#2              0
 PL BOUND     I#2#1#2 
 LO BOUND     I#2#1#3              0
 PL BOUND     I#2#1#3 
 LO BOUND     I#2#1#4              0
 PL BOUND     I#2#1#4 
 LO BOUND     I#2#2#0              0
 PL BOUND     I#2#2#0 
 LO BOUND     I#2#2#1              0
 PL BOUND     I#2#2#1 
 LO BOUND     I#2#2#2              0
 PL BOUND     I#2#2#2 
 LO BOUND     I#2#2#3              0
 PL BOUND     I#2#2#3 
 LO BOUND     I#2#2#4              0
 PL BOUND     I#2#2#4 
 LO BOUND     I#3#1#0              0
 PL BOUND     I#3#1#0 
 LO BOUND     I#3#1#1              0
 PL BOUND     I#3#1#1 
 LO BOUND     I#3#1#2              0
 PL BOUND     I#3#1#2 
 LO BOUND     I#3#1#3              0
 PL BOUND     I#3#1#3 
 LO BOUND     I#3#1#4              0
 PL BOUND     I#3#1#4 
 LO BOUND     I#3#2#0              0
 PL BOUND     I#3#2#0 
 LO BOUND     I#3#2#1              0
 PL BOUND     I#3#2#1 
 LO BOUND     I#3#2#2              0
 PL BOUND     I#3#2#2 
 LO BOUND     I#3#2#3              0
 PL BOUND     I#3#2#3 
 LO BOUND     I#3#2#4              0
 PL BOUND     I#3#2#4 
 LO BOUND     f#1#1#1              0
 PL BOUND     f#1#1#1 
 LO BOUND     f#1#1#2              0
 PL BOUND     f#1#1#2 
 LO BOUND     f#1#1#3              0
 PL BOUND     f#1#1#3 
 LO BOUND     f#1#1#4              0
 PL BOUND     f#1#1#4 
 LO BOUND     f#1#2#1              0
 PL BOUND     f#1#2#1 
 LO BOUND     f#1#2#2              0
 PL BOUND     f#1#2#2 
 LO BOUND     f#1#2#3              0
 PL BOUND     f#1#2#3 
 LO BOUND     f#1#2#4              0
 PL BOUND     f#1#2#4 
 LO BOUND     f#2#1#1              0
 PL BOUND     f#2#1#1 
 LO BOUND     f#2#1#2              0
 PL BOUND     f#2#1#2 
 LO BOUND     f#2#1#3              0
 PL BOUND     f#2#1#3 
 LO BOUND     f#2#1#4              0
 PL BOUND     f#2#1#4 
 LO BOUND     f#2#2#1              0
 PL BOUND     f#2#2#1 
 LO BOUND     f#2#2#2              0
 PL BOUND     f#2#2#2 
 LO BOUND     f#2#2#3              0
 PL BOUND     f#2#2#3 
 LO BOUND     f#2#2#4              0
 PL BOUND     f#2#2#4 
 LO BOUND     f#3#1#1              0
 PL BOUND     f#3#1#1 
 LO BOUND     f#3#1#2              0
 PL BOUND     f#3#1#2 
 LO BOUND     f#3#1#3              0
 PL BOUND     f#3#1#3 
 LO BOUND     f#3#1#4              0
 PL BOUND     f#3#1#4 
 LO BOUND     f#3#2#1              0
 PL BOUND     f#3#2#1 
 LO BOUND     f#3#2#2              0
 PL BOUND     f#3#2#2 
 LO BOUND     f#3#2#3              0
 PL BOUND     f#3#2#3 
 LO BOUND     f#3#2#4              0
 PL BOUND     f#3#2#4 
 LO BOUND     y#1#1#1              0
 PL BOUND     y#1#1#1 
 LO BOUND     y#1#1#2              0
 PL BOUND     y#1#1#2 
 LO BOUND     y#1#1#3              0
 PL BOUND     y#1#1#3 
 LO BOUND     y#1#1#4              0
 PL BOUND     y#1#1#4 
 LO BOUND     y#1#2#1              0
 PL BOUND     y#1#2#1 
 LO BOUND     y#1#2#2              0
 PL BOUND     y#1#2#2 
 LO BOUND     y#1#2#3              0
 PL BOUND     y#1#2#3 
 LO BOUND     y#1#2#4              0
 PL BOUND     y#1#2#4 
 LO BOUND     y#1#3#1              0
 PL BOUND     y#1#3#1 
 LO BOUND     y#1#3#2              0
 PL BOUND     y#1#3#2 
 LO BOUND     y#1#3#3              0
 PL BOUND     y#1#3#3 
 LO BOUND     y#1#3#4              0
 PL BOUND     y#1#3#4 
 LO BOUND     y#1#4#1              0
 PL BOUND     y#1#4#1 
 LO BOUND     y#1#4#2              0
 PL BOUND     y#1#4#2 
 LO BOUND     y#1#4#3              0
 PL BOUND     y#1#4#3 
 LO BOUND     y#1#4#4              0
 PL BOUND     y#1#4#4 
 LO BOUND     y#1#5#1              0
 PL BOUND     y#1#5#1 
 LO BOUND     y#1#5#2              0
 PL BOUND     y#1#5#2 
 LO BOUND     y#1#5#3              0
 PL BOUND     y#1#5#3 
 LO BOUND     y#1#5#4              0
 PL BOUND     y#1#5#4 
 LO BOUND     y#1#6#1              0
 PL BOUND     y#1#6#1 
 LO BOUND     y#1#6#2              0
 PL BOUND     y#1#6#2 
 LO BOUND     y#1#6#3              0
 PL BOUND     y#1#6#3 
 LO BOUND     y#1#6#4              0
 PL BOUND     y#1#6#4 
 LO BOUND     y#2#1#1              0
 PL BOUND     y#2#1#1 
 LO BOUND     y#2#1#2              0
 PL BOUND     y#2#1#2 
 LO BOUND     y#2#1#3              0
 PL BOUND     y#2#1#3 
 LO BOUND     y#2#1#4              0
 PL BOUND     y#2#1#4 
 LO BOUND     y#2#2#1              0
 PL BOUND     y#2#2#1 
 LO BOUND     y#2#2#2              0
 PL BOUND     y#2#2#2 
 LO BOUND     y#2#2#3              0
 PL BOUND     y#2#2#3 
 LO BOUND     y#2#2#4              0
 PL BOUND     y#2#2#4 
 LO BOUND     y#2#3#1              0
 PL BOUND     y#2#3#1 
 LO BOUND     y#2#3#2              0
 PL BOUND     y#2#3#2 
 LO BOUND     y#2#3#3              0
 PL BOUND     y#2#3#3 
 LO BOUND     y#2#3#4              0
 PL BOUND     y#2#3#4 
 LO BOUND     y#2#4#1              0
 PL BOUND     y#2#4#1 
 LO BOUND     y#2#4#2              0
 PL BOUND     y#2#4#2 
 LO BOUND     y#2#4#3              0
 PL BOUND     y#2#4#3 
 LO BOUND     y#2#4#4              0
 PL BOUND     y#2#4#4 
 LO BOUND     y#2#5#1              0
 PL BOUND     y#2#5#1 
 LO BOUND     y#2#5#2              0
 PL BOUND     y#2#5#2 
 LO BOUND     y#2#5#3              0
 PL BOUND     y#2#5#3 
 LO BOUND     y#2#5#4              0
 PL BOUND     y#2#5#4 
 LO BOUND     y#2#6#1              0
 PL BOUND     y#2#6#1 
 LO BOUND     y#2#6#2              0
 PL BOUND     y#2#6#2 
 LO BOUND     y#2#6#3              0
 PL BOUND     y#2#6#3 
 LO BOUND     y#2#6#4              0
 PL BOUND     y#2#6#4 
 LO BOUND     y#3#1#1              0
 PL BOUND     y#3#1#1 
 LO BOUND     y#3#1#2              0
 PL BOUND     y#3#1#2 
 LO BOUND     y#3#1#3              0
 PL BOUND     y#3#1#3 
 LO BOUND     y#3#1#4              0
 PL BOUND     y#3#1#4 
 LO BOUND     y#3#2#1              0
 PL BOUND     y#3#2#1 
 LO BOUND     y#3#2#2              0
 PL BOUND     y#3#2#2 
 LO BOUND     y#3#2#3              0
 PL BOUND     y#3#2#3 
 LO BOUND     y#3#2#4              0
 PL BOUND     y#3#2#4 
 LO BOUND     y#3#3#1              0
 PL BOUND     y#3#3#1 
 LO BOUND     y#3#3#2              0
 PL BOUND     y#3#3#2 
 LO BOUND     y#3#3#3              0
 PL BOUND     y#3#3#3 
 LO BOUND     y#3#3#4              0
 PL BOUND     y#3#3#4 
 LO BOUND     y#3#4#1              0
 PL BOUND     y#3#4#1 
 LO BOUND     y#3#4#2              0
 PL BOUND     y#3#4#2 
 LO BOUND     y#3#4#3              0
 PL BOUND     y#3#4#3 
 LO BOUND     y#3#4#4              0
 PL BOUND     y#3#4#4 
 LO BOUND     y#3#5#1              0
 PL BOUND     y#3#5#1 
 LO BOUND     y#3#5#2              0
 PL BOUND     y#3#5#2 
 LO BOUND     y#3#5#3              0
 PL BOUND     y#3#5#3 
 LO BOUND     y#3#5#4              0
 PL BOUND     y#3#5#4 
 LO BOUND     y#3#6#1              0
 PL BOUND     y#3#6#1 
 LO BOUND     y#3#6#2              0
 PL BOUND     y#3#6#2 
 LO BOUND     y#3#6#3              0
 PL BOUND     y#3#6#3 
 LO BOUND     y#3#6#4              0
 PL BOUND     y#3#6#4 
 LO BOUND     p#1                  0
 UP BOUND     p#1                  1
 LO BOUND     p#2                  0
 UP BOUND     p#2                  1
 LO BOUND     p#3                  0
 UP BOUND     p#3                  1
 LO BOUND     p#4                  0
 UP BOUND     p#4                  1
 LO BOUND     p#5                  0
 UP BOUND     p#5                  1
 LO BOUND     p#6                  0
 UP BOUND     p#6                  1
ENDATA
