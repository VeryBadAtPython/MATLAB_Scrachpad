S=[0.5,0.3,0.2];
T=[0.4,0.3,0.3;0.3,0.4,0.3;0.3,0.3,0.4];

maxWeeks=5;

a=zeros(maxWeeks+1,3);
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
legend("Store A","Store B","Store C")
title("S_0T^t for t=0:1:5and S_0=[0.5,0.3,0.2]")