S=[1,0];
T=[0.43,0.57;0.28,0.72];

maxWeeks=5;

a=zeros(maxWeeks+1,2);
a(1,:)=S;

for weeks=1:1:maxWeeks;
  ST=S*T;
  a(weeks+1,:)=ST;
  S=ST;
endfor

t=[0:1:maxWeeks];
plot (t',a)
xlabel("t (Weeks)")
ylabel("Market Share (proportion of the whole)")
axis([0 maxWeeks 0.0 1])
grid on
legend("Store A","Store B")
title("S_0T^t for t=0:1:5 and S_0=[1,0save a]")


