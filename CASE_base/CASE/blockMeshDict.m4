/*--------------------------------*- C++ -*----------------------------------*\
| =========                 |                                                 |
| \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           |
|  \\    /   O peration     | Version:  2.0.0                                 |
|   \\  /    A nd           | Web:      www.OpenFOAM.com                      |
|    \\/     M anipulation  |                                                 |
\*---------------------------------------------------------------------------*/
FoamFile
{
    version     2.0;
    `format'      ascii;
    class       dictionary;
    object      blockMeshDict;
}
include(./CASE/CASE.m4)
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// General macros to create 2D/extruded-2D meshes
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
scale 0.001;
 
define(pi, 3.14159265)
//
// CALCULATED VALUES
define(FR, 		   calc(P/2))   // Far Radius
define(IR, 		 calc(Din/2))   // Inner Radius
define(OR, 		calc(Dout/2))   // Outer Radius


define(cR, 1e-2)          // Typical cell size in mm!
define(deg, 0.5)            // Axisymm. wedge degrees

// CALCULATED VALUES
define(rad, calc(pi*deg/180))
define(x1,   calc(FR))
define(x2,   calc(OR))
define(x3,   calc(IR))
define(x4, calc(IR/2))
define(z1, calc(0.1))
define(z2, calc(z1))
define(z3, calc(z1))
define(z4, calc(z1))
//
define(delta, calc(IR/Ni))
define(AZ1,	calcInt(S*L/delta)) 
define(AZ2, calcInt(S*H/delta))
//
define(AX1, calcInt(IR*S/delta))  
define(AX2, calcInt((OR-IR)*S/delta ))
define(AX3, calcInt((FR-OR)*S/delta))
define(AX4, calcInt((Hd-He)*S/delta))
define(AX5, calcInt(((OR-IR)*S/delta)))
//
define(SX1, calc(1))
define(SX2, calc(1))


vertices
(
( 0	 L  z3 ) //0
(x3  L  z3 ) //1
(x3	 0  z3 ) //2
(x2	 0  z2 ) //3
(x2	 L  z2 ) //4
(x1	 L  z1 ) //5
(x1	 0  z1 ) //6
(x1	-H  z1 ) //7
(x2	-H  z2 ) //8
(x3	-H  z3 ) //9
( 0	-H  z3 ) //10
( 0	 0  z3 ) //11
(x3	 L -z3 ) //12
(x3	 0 -z3 ) //13
(x2	 0 -z2 ) //14
(x2	 L -z2 ) //15
(x1	 L -z1 ) //16
(x1	 0 -z1 ) //17
(x1	-H -z1 ) //18
(x2	-H -z2 ) //19
(x3	-H -z3 ) //20
(x4	 L  z4 ) //21
(x4	 L -z4 ) //22
(x4	 0  z4 ) //23
(x4	 0 -z4 ) //24
(x4	-H  z4 ) //25
(x4	-H -z4 ) //26
( 0	 L -z3 ) //27
( 0	-H -z3 ) //28
( 0	 0 -z3 ) //29

);


 
blocks
(

hex (27  12 1 0  29 13 2 11)		(AX1 1 AZ1) simpleGrading 	(1   1  1) 	// 
hex (29 13 2 11 28 20 9 10) 		(AX1 1 AZ2) simpleGrading 	(1   1  1) 	// 
hex (13 14 3 2  20 19 8 9) 			(AX2 1 AZ2) simpleGrading 	(SX2 1  1) 	// 
hex (15 16 5 4  14 17 6 3) 			(AX3 1 AZ1) simpleGrading 	(SX1 1  1) 	// 
hex (14 17 6 3  19 18 7 8) 			(AX3 1 AZ2) simpleGrading 	(SX1 1  1) 	// 

);
 
 
edges
(
);

boundary
(
 
     axis
     { 
           type patch;
           faces  
           (
               (0 27 29 11)
			   (11 29 28 10)

           );
      }
	  
	 wedge_pos
     { 
           type patch;
           faces  
           (
				(0 1 2 11)
				(11 2 9 10)
				(2 3 8 9)
				(4 5 6 3)
				(3 6 7 8)

           );
      }
     wedge_neg
     { 
           type patch;
           faces  
           (
			
				(27 12 13 29)
				(29 13 20 28)
				(13 14 19 20)
				(15 16 17 14)
				(14 17 18 19)

           );
      }
	  
     domainWall
     { 
           type patch;
           faces  
           (
               (5 16 17 6)
			   (6 17 18 7)

           );
      }


     floor
     { 
           type patch;
          faces  
           (
			   (20 19 8 9)
			   (19 18 7 8)

          );
     }
	 
     inlet
     { 
           type patch;
           faces  
           (
               (27 12 1 0)

           );
      }
     topWall
     { 
           type patch;
           faces  
           (
               (15 16 5 4)

           );
      }
     electWall
     { 
           type patch;
           faces  
           (
               (1 12 13 2)
			   (2 13 14 3)
			   (4 15 14 3)

           );
      }
	 out
     { 
           type patch;
           faces  
           (
		
			(28 20 9 10)

           );
      }

);

mergePatchPairs
(
);