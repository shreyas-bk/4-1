clear all;

val = 140;
original = zeros(16,16);
original(:,3:4) = val;
original(:,7:8) = val;
original(3:4,8:16) = val;
original(7:8,8:16) = val;
original(11:12,8:16) = val;
original(15:16,8:16) = val;
figure
imshow(original);

q50 = [16 11 10 16 24 40 51 61;
       12 12 14 19 26 58 60 55;
       14 13 16 24 40 57 69 56;
       14 17 22 29 51 87 80 62;
       18 22 37 56 68 109 103 77;
       24 35 55 64 81 104 113 92;
       49 64 78 87 103 121 120 101;
       72 92 95 98 112 100 103 99];

new = original; 
[height, width] = size(new);
r = height/8;
c = width/8;
s = 1;
for i=1:r
    e = 1;
    for j=1:c
        sub = new(s:s+7,e:e+7);
        dct_sub = dct2(sub);
          for x=1:8
              for y=1:8
                  q(x, y) = round(dct_sub(x, y)/q50(x, y));
              end
          end
          final(s:s+7,e:e+7) = q;
          e = e + 8;
      end
      s = s + 8;
end
  
figure
imshow(final);