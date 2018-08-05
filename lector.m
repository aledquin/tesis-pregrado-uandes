clear all;
warning off;

book = csvread('Datos Alumnos\Grupo2\GRUPO2.CSV');
[len_book,rows] = size(book);
cero3 = [[0 0 0];[0 0 0];[0 0 0]];
cero =[0 0 0];
data_begin = [];
data_end = [];
%Buscador de Indices
for i = 2:len_book-1
        if (book(i-1:i+1,:) == cero3)
          if (i<3) & (book(i+2,:)~= cero)  
              data_begin=[data_begin i+2];
          elseif  (i>2) 
              if (book(i+2,:)~=cero) 
                  data_begin = [data_begin i+2];
              end
              if (book(i-2,:) ~= cero)
                  data_end = [data_end i-2];
              end
          end
        end
        if i == len_book-1
            data_end = [data_end i];
        end
end

[~,len_data]= size(data_end);
vec_LLE_x =[];
vec_LLE_y =[];
vec_LLE_z =[];
vec_LLE_yz =[];
vec_LLE_xyz =[];
vec_lamb_x =[];
vec_lamb_y =[];
vec_lamb_z =[];
vec_lamb_yz =[];
vec_lamb_xyz =[];

for i = 1:1 %len_data
    [LLEx lambx] = lyaprosen(book(data_begin(i):data_end(i),1), 0.015, 0);
    [LLEy lamby] = lyaprosen(book(data_begin(i):data_end(i),2), 0.015, 0);
    [LLEz lambz] = lyaprosen(book(data_begin(i):data_end(i),3), 0.015, 0);
    [LLEyz lambyz] = lyaprosen(book(data_begin(i):data_end(i),2:3), 0.015, 0);
    [LLExyz lambxyz] = lyaprosen(book(data_begin(i):data_end(i),:), 0.015, 0);
    
    vec_LLE_x =[vec_LLE_x LLEx];
    vec_LLE_y =[vec_LLE_y LLEy];
    vec_LLE_z =[vec_LLE_z LLEz];
    vec_LLE_yz =[vec_LLE_yz LLEyz];
    vec_LLE_xyz =[vec_LLE_xyz LLExyz];
    
    vec_lamb_x =[vec_lamb_x lambx];
    vec_lamb_y =[vec_lamb_y lamby];
    vec_lamb_z =[vec_lamb_z lambz];
    vec_lamb_yz =[vec_lamb_yz lambyz];
    vec_lamb_xyz =[vec_lamb_xyz lambxyz];
end

