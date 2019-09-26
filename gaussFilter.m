function [ d ] = gaussFilter( N, var )

%where N decides the size of the filter 
% var decides the variance of the filter

d=zeros(N);

for n=1:N

   for m=1:N
   
       d(n,m)=exp(-((n-(N+1)/2)^2+(m-(N+1)/2)^2)/(2*var^2));
   end
end
c=sum(sum(d));
d=d./c;
end 