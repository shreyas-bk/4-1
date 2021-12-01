cameraman=imread('cameraman.tif');
cameraman=imresize(cameraman, [512 512]);
hist_count=imhist(cameraman);
total=sum(hist_count);
maximum=0;
for i=1:1:256
    P(i)=hist_count(i)/total;
end
for T=2:255
    w0=sum(P(1:T));
    w1=sum(P(T+1:256));
    u0=dot([0:T-1],P(1:T))/w0;
    u1=dot([T:255],P(T+1:256))/w1;
    sigma=w0*w1*((u1-u0)^2);
    if sigma>maximum
        maximum=sigma;
        threshold=T-1;
    end
end
res = im2bw(cameraman,threshold/255);
imshow(res);
imwrite(res, 'result.png')