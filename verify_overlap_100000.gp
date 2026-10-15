default(parisizemax,16000000000);
{
  N=50000; h=782; G=(N+h-1)\h;
  B=bernvec(N); n=vector(N,k,abs(numerator(B[k+1]))); B=0;
  Q=vector(G,b,vecprod(n[(b-1)*h+1..min(b*h,N)])); C=1;
  for(b=1,G,
    v=n[(b-1)*h+1..min(b*h,N)];
    C=lcm(C,lcm(apply(a->gcd(a,Q[b]/a),v)));
    t=1; for(c=b+1,G,t=t*(Q[c]%Q[b])%Q[b]);
    C=lcm(C,gcd(Q[b],t));
  );
  F=factor(C); P=F[,1];
  if(factorback(F)!=C || !vecprod(apply(isprime,P)),error("invalid factorization"));
  p=if(#P,P[#P],1);
  f=fileopen("verification-100000.txt","w");
  filewrite(f,Str("MAX_INDEX=",2*N,"\nNUMBER_OF_SHARED_PRIMES=",#P,
    "\nMAX_SHARED_PRIME=",p,"\nSHARED_PRIMES_AT_OR_ABOVE_2^31=",select(a->a>=2^31,P),
    "\nLARGEST_PRIME_INDICES=",if(#P,2*select(k->n[k]%p==0,[1..N]),[]),
    "\nSHARED_PRIMES=",P,"\nSHARED_FACTORIZATION=",F,"\nCOMPLETE=1"));
  fileclose(f);
}
