

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

InstallGlobalFunction( TensorProductOfSimplesModYD, function( simple1, simple2 )
    local gens, mgens, gen1, gen2, newrho, rep;
    gens  := simple1!.GeneratorsOfG;
    gen1  := simple1!.GeneratorsOfImages;
    gen2  := simple2!.GeneratorsOfImages;
    mgens := List( [1..Length( gens )],
                    i -> TensorProductOfMat( gen1[i], gen2[i] ) );
    newrho   := GroupHomomorphismByImagesNC( gens, Group( mgens ) );
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
