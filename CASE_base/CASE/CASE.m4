// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// MACROS FOR CASE DEFINITION FOR GRID CONSTRUCTIONS
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
changecom(//)changequote([,])
define(calc, [esyscmd(perl -e 'print ($1)')])
define(calcInt, [esyscmd(perl -e 'print int($1)')])
// Units are in mm
define(H, 		10.00)   			// Height (from tip nozzle to ground plate)
define(L,  		1.00)   			// Lenght nozzle
define(P, 	    14.00)   			// Farfield / Plane size
define(Din, 	0.7)   				// Nozzle Inner Diameter
define(Dout, 	1.0)   				// Nozzle Outer Diameter
define(Do, 		0.35)   			// Outlet Diameter (Din/2 else is not squared)
define(Ni,  5) 						// Number of points in the inlet radius
define(SYM, 1)      				// (0 = do the symmetry plane) (1 = no symmetry plane)
define(S,   1)  					// Refinement Level

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
