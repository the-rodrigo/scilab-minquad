clear; clc; close;

//Exercicio Minimos Quadrados

//Formando o vetor xi
    
    n = input("Quantos pontos xi você deseja preencher?")
    
    for i=1:n
        xi(i,1) = input("Entre com um valor de xi:")
    end
    
//Utilizando programa sem input do usuário
    
    //n = 25
    
    //for i=1:n
    //    xi(i,1) = i*4
    //end
    
// Achando Limites
    
    
    menor = xi(1,1)
    for i=2:n
        if menor > xi(i,1) then
            menor = xi(i,1)
        end
    end
    
    maior = xi(1,1)
    for i=2:n
        if maior < xi(i,1) then
            maior = xi(i,1)
        end
    end
    
//Formando o vetor yi

    yi = grand(n, 1, 'unf', menor, maior)

//Ordenando vetores crescentes
    
    for i=1:(n-1)
        for j=(i+1):n
            if (yi(i) > yi(j)) then
                aux = yi(i)
                yi(i) = yi(j)
                yi(j) = aux
            end
        end
    end
    
    for i=1:(n-1)
        for j=(i+1):n
            if (xi(i) > xi(j)) then
                aux = xi(i)
                xi(i) = xi(j)
                xi(j) = aux
            end
        end
    end

//Calculando Paramentros para os Minimos Quadrados

    som_1 = 0;
    for i=1:n
        som_1 = som_1 + xi(i)*yi(i);
    end
    
    som_2 = 0;
    for i=1:n
        som_2 = som_2 + xi(i);
    end
    
    som_3 = 0;
    for i=1:n
        som_3 = som_3 + yi(i);
    end
    
    som_4 = 0;
    for i=1:n
        som_4 = som_4 + (xi(i)^2);
    end
    
    som_5 = 0;
    for i=1:n
        som_5 = som_5 + (yi(i)^2);
    end
    
    //Calculo de a
        
        term_1 = n * som_1;
        term_2 = som_2 * som_3;
        term_3 = n * som_4;
        term_4 = som_2^2;
        denominador = term_3 - term_4;
        
        a = (term_1 - term_2)/denominador;
        
    //Calculo de b
        
        term_5 = som_4 * som_3;
        term_6 = som_2 * som_1;
        
        b = (term_5 - term_6)/denominador;
        
    //Calculo do Coeficiente de Correlação Linear
        
        term_7 = (n * som_4) - ((som_2)^2);
        term_8 = (n * som_5) - ((som_3)^2);
        denominador_2 = sqrt((term_7 * term_8));
        
        r2 = (((term_1 - term_2)/denominador_2)^2);
        
    //Retorno de Valores
        
        printf("\n")
        printf("O coeficiente angular é: %g \n", a)
        printf("O coeficiente linear é: %g \n", b)
        printf("O coeficiente de correlação linear é: %g", r2)
        
//Construção do Gráfico de Plotagem
    
    y = a * xi + b

    plot(xi,y,'b',xi,yi,'ks')
