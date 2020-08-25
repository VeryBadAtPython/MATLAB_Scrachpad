%~~~~~~~~~~~~~~~~~~~Compute for yacht A~~~~~~~~~~~~~~~~~~~~~~~

SA=[-10,4]; %Define initial displacement
vA=[2,-1]; %Velocity vector
OverallTime=15; %Time length of computation
%step=1; %Define fidelity of computation
PositionA=zeros(OverallTime+1,3); %Setup of results matrix

for t=0:1:OverallTime; %Computes for t=0 to t=OverallTime
  PA=SA+t*vA; %Displacement from origin as a function of time
  PositionA(t+1,1)=t; %Appends time value to leftmost collumn of results matrix
  PositionA(t+1,2:3)=PA; %Appends x and y of position to results matrix
endfor
display(PositionA) %Prints Positioin of Boat A over time to console

%~~~~~~~~~~~~~Process repeats for boat B parameters~~~~~~~~~~~~

SB=[3,-13];
vB=[-1,3];

PositionB=zeros(OverallTime+1,3);

for t=0:1:OverallTime;
  PB=SB+t*vB;
  PositionB(t+1,1)=t;
  PositionB(t+1,2:3)=PB;
endfor

display(PositionB) %Prints Positioin of Boat B over time to console

%~~~~~~Compute vector AB over time and the abs value of AB~~~~~~~~~~~

OverallAB=zeros(OverallTime+1,4); %Sets up results matrix

for t=0:1:OverallTime;
OverallAB(t+1,1)=t; %Sets first collumn as the time
AB=PositionB(t+1,2:3)-PositionA(t+1,2:3); %AB=OB-OA
OverallAB(t+1,2:3)=AB; %Appends the components of AB to collumns 3&4
d=sqrt(AB(1,1)^2+AB(1,2)^2); %d between A and B =\sqrt{x^2+y^2}
OverallAB(t+1,4)=d; %Appends d to final collumn of results matrix
endfor

display(OverallAB) %Prints results of AB calculations

xaxis=0:1:OverallTime;
plot(xaxis,OverallAB(:,4)) %Plots d between yachts as a function of t
