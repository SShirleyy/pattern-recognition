%test for forward and backward
%finite case
mc1 = MarkovChain([1;0], [0.9 0.1 0;0 0.9 0.1]);
%infinite case
mc2 = MarkovChain([1;0], [0.9 0.1;0.1 0.9]);

%mc = mc1;
mc = mc1;
g1 = GaussD('Mean',0,'StDev',1); 
g2 = GaussD('Mean',3,'StDev',2);

obs = [-0.2 2.6 1.3];

pX = prob([g1,g2],obs);

[alfaHat, c] = forward(mc,pX)

%c = [1,0.1625,0.8266,0.0581];

betaHat = backward(mc,pX,c)
