%okay lets begin
clc;
clear all;

load fisheriris;
%so we want to make the ith species correspond to the ith row of
%information from meas, so we have to use the constructor which takes in 4
%parameters, that match up with meas and for each parameter stay in the
%column and increment down the rows to map this information into cellArray
for i=1:150
    cellArray(i) = Flower(meas(i,4), meas(i,3), meas(i,2), meas(i,1), strtrim(species{i}));
end
%testing getSLength on the 25th Flower in the cell array, thank you kevin
%lin for helping me debug my code
j = getSLength(cellArray(25));
boolean = j == meas(25, 1);
report(cellArray(1));