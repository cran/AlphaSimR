#include "alphasimr.h"

/*
 * OCS
 *  1. Crossing
 *  2. Selection
 *  
 * Usefulness
 *  1. DH
 *  2. Fx
 *  3. Gametic variance
 *  EBV, GV, Pheno, index
 *  Steps
 *    1. Pull relevant markers
 *    2. Create CO progeny mask population
 *    3. Set parental genotypes to estimated effects
 *    3. Drop parental effects through mask
 *    4. Calculate usefulness
 *  
 *  Pedigree relationship functions from pedigreeTools
 * 
 */

