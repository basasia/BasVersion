% ==========================
% Filename: Perceptron_XOR.m
% ==========================
%
% Two witnesses that I Michael Tonkin (id 18039133) considered, ran and examined the output of the code.  
%   Demonstrated to Asia Benyadilok (student id 18020561) Thursday 30-January-2020  
%   Demonstrated to Christy Francis (student id 18042692)Thursday 30-January-2020 
%
%   My comments: 
% Before running this script I have noted that the layout of the points on
% the chart represented by the plot will cause a great deal of difficulty
% for the perceptron as they are arranged in such as manner as to make it
% impossible for the data to be classified with a single line. This is
% because each point of the same class (data type) has been placed diagonally to
% eachother. Looking at the code there is no infinite loop or infinite recurrsion
% so I expect that it will attempt to find a solution 10 times (looking at
% the only for loop) before exiting without a valid solution. 
%
%I have just finished running the program and it seems to have met my
%expectations. The line essentially alternated between two points at the
%bottom left of the screen before the program exited. 
%
%
echo on;
%
% ====================================================================
% The perceptron: an attempt to learn linearly non-separable functions
% ====================================================================

% ============================================================================
% Reference: Negnevitsky, M., "Artificial Intelligence: A Guide to Intelligent  
%            Systems", 3rd edn. Addison Wesley, Harlow, England, 2011.
%            Sec. 6.3 The perceptron
% ============================================================================

% ===========================================================================
% Problem: Two-input perceptron is required to perform logical operation XOR.
% ===========================================================================

% Hit any key to define four 2-element input vectors denoted by "p". 
pause 

p=[0 0 1 1;0 1 0 1;0 0 0 1]

% Hit any key to define four 1-element target vectors denoted by "t". 
pause 

t=[0 1 1 0]

% Hit any key to plot the input and target vectors.
v=[-2 3 -2 3 -2 3];

plotpv(p,t,v);

% Hit any key to create the perceptron and set its initial weights to random 
% numbers in the range [0, 1]. The perceptron's threshold is set to zero.
pause

net=newp([0 1;0 1;0 1],1);
w=(rands(3))';
b=[0];
net.IW{1,1}=w;
net.b{1}=b;

plotpv(p,t,v);
linehandle=plotpc(net.IW{1},net.b{1});

% Hit any key to train the perceptron for one pass and plot the classification line. 
% The training will be stoped after 10 passes.
pause

for a=1:50;
   [net,Y,E]=adapt(net,p,t);
   linehandle=plotpc(net.IW{1},net.b{1},linehandle);
   %pause
end;

% Hit any key to see that the perceptron has not learned the XOR operation.
pause

p=[1;1;0]
a=sim(net,p)

% Hit any key to continue.
pause

p=[0;1;1]
a=sim(net,p)

% Hit any key to continue.
pause

p=[1;0;1]
a=sim(net,p)

% Hit any key to continue.
pause

p=[0;0;0]
a=sim(net,p)

pause

p=[1;0;0]
a=sim(net,p)

pause

p=[0;1;0]
a=sim(net,p)

pause

p=[0;0;1]
a=sim(net,p)
pause

p=[1;1;1]
a=sim(net,p)

echo off
disp('end of Perceptron_XOR')