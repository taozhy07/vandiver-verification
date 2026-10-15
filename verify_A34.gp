p = 151628697551;
q = 12*p + 1;
z = Mod(4096, q);
t = 891933515;
s = 5000000;
h = (t + s - 1) \ s;

block(a, n) =
{
  my(x = z^a, y = x^-1, e = lift(Mod(a, p)^-34));
  my(u = lift(Mod(2, p)^-34), v = Mod(1, q));

  for(i = 1, n,
    v *= (x - y)^e;
    x *= x;
    y *= y;
    e = e*u % p
  );
  v
};

job(j) =
{
  my(i = j - 1, o = (i % h)*s);
  my(a = lift(Mod(7, p)^(i \ h)*Mod(2, p)^o));

  block(a, min(s, t - o))
};

exportall();

v = parvector(85*h, j, job(j));

print(if(vecprod(v)^12 != 1, "PASS", "INCONCLUSIVE"));
