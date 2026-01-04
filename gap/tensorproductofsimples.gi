
##############################################################################
##
##  TensorProductMatrix( A, B )  . . .  Tensor product of two matrices
##
##  This function computes the tensor (Kronecker) product of the matrices A and B.
##  It is intended as a faster alternative to GAP's built-in `KroneckerProduct`,
##  which in practical experiments has shown significantly slower performance.
##  For example, benchmarking with two 60×60 matrices shows that the native
##  command takes approximately twice as long as this implementation.
##
##  The resulting matrix has size (m*k) × (n*l), where A is an m×n matrix
##  and B is a k×l matrix. Each entry aᵢⱼ of A is multiplied by the whole matrix B,
##  and the resulting blocks are concatenated in the standard Kronecker product order.
##
##############################################################################

InstallGlobalFunction( TensorProductOfMat, function( A, B )
    local u, v, matrix;
    
    matrix := [ ];
    
    for u in A do
        for v in B do
            Add( matrix, Flat( List( u, x -> x * v ) ) );
        od;
    od;

    return matrix ;
end);

##############################################################################

InstallGlobalFunction( TensorProductOfSimplesModYD, function( simple1, simple2 )
    local gens, mgens, gen1, gen2, newrho, rep, G;
    G  := simple1!.GroupAttachedToMod;
    gens := GeneratorsOfGroup( G );
    gen1  := List( gens, x -> x^(simple1!.Simple) );;
    gen2  := List( gens, x -> x^(simple2!.Simple) );;
    mgens := List( [1..Length( gens )],
                    i -> TensorProductOfMat( gen1[i], gen2[i] ) );
    newrho   := GroupHomomorphismByImagesNC( G, Group( mgens ), gens, mgens );
    rep   := rec(
                group             := simple1!.GroupAttachedToMod,
                generatorsofgroup := gens,        # new feature
                rho               := newrho,      # new feature
                genimages         := mgens,
                isRepresentation  := true,
                dimension         := Length(mgens[1]),
    );
    return rep;
end);
