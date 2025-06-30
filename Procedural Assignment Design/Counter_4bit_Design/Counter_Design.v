module Counter_Design(Q, T, Clock, Clear);
output [3:0] Q;
input Clock, Clear, T;
wire T1, T2, T3;
T_FF(T, Q[0], Clock, Clear);
and (T1, Q[0], T);
T_FF(T1, Q[1], Clock, Clear);
and (T2, Q[1], T1);
T_FF(T2, Q[2], Clock, Clear);
and (T3, Q[2], T2);
T_FF(T3, Q[3], Clock, Clear);
endmodule
