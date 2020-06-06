S=[0.5,0.2,0.1,0.15,0.05];
T=[0.3,0.3,0.2,0.1,0.1;0.3,0.3,0.1,0.1,0.2;0.3,0.1,0.3,0.2,0.1;0.2,0.3,0.1,0.3,0.1;0.3,0.3,0.2,0.1,0.1];

maxWeeks=10;

a=zeros(maxWeeks+1,5);
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
axis([0 maxWeeks 0.0 0.75])
grid on
legend("Store A","Store B","Store C","Store D","Store E")
title("S_0T^t for t=0:1:10 and S_0=[0.5,0.2,0.1,0.15,0.05]")