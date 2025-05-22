#include <iostream>
#include <cstdlib>

int main(void) {
#if defined(SINCEROVISKY)
    std::cout << "Make to c++ stinks too, uh!!!" << std::endl;
#else
    std::cout << "Make to c++ is a toletin no fundo de um vaso fedorento chamando boost..." << std::endl;
#endif // defined(SINCEROVISKY)
    return EXIT_SUCCESS;
}
