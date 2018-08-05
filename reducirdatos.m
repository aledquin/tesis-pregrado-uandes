K = 6;
data_for_person = 3;

vec_LLE_x = reshape(vec_LLE_x,[K,data_for_person]);
vec_LLE_y = reshape(vec_LLE_y,[K,data_for_person]);
vec_LLE_z = reshape(vec_LLE_z,[K,data_for_person]);
vec_LLE_yz = reshape(vec_LLE_yz,[K,data_for_person]);
vec_LLE_xyz = reshape(vec_LLE_xyz,[K,data_for_person]);

% vec_LLE_x = reshape([vec_LLE_x(:,3) vec_LLE_x(:,6)],[2*K,1]);
% vec_LLE_y = reshape([vec_LLE_y(:,3) vec_LLE_y(:,6)],[2*K,1]);
% vec_LLE_z = reshape([vec_LLE_z(:,3) vec_LLE_z(:,6)],[2*K,1]);
% vec_LLE_yz = reshape([vec_LLE_yz(:,3) vec_LLE_yz(:,6)],[2*K,1]);
% vec_LLE_xyz = reshape([vec_LLE_xyz(:,3) vec_LLE_xyz(:,6)],[2*K,1]);

vec_LLE_sort = [vec_LLE_x(:,3) vec_LLE_y(:,3) vec_LLE_z(:,3) vec_LLE_yz(:,3) vec_LLE_xyz(:,3)];
%vec_LLE_sort = [vec_LLE_x vec_LLE_y vec_LLE_z vec_LLE_yz vec_LLE_xyz];

vec_lamb_x_sort =[];
vec_lamb_y_sort =[];
vec_lamb_z_sort =[];
vec_lamb_yz_sort =[];
vec_lamb_xyz_sort =[];

for i = 1:data_for_person:len_data
%     vec_lamb_x_sort =[vec_lamb_x_sort vec_lamb_x(:,i+2) vec_lamb_x(:,i+5)];
%     vec_lamb_y_sort =[vec_lamb_y_sort vec_lamb_y(:,i+2) vec_lamb_y(:,i+5)];
%     vec_lamb_z_sort =[vec_lamb_z_sort vec_lamb_z(:,i+2) vec_lamb_z(:,i+5)];
%     vec_lamb_yz_sort =[vec_lamb_yz_sort vec_lamb_yz(:,i+2) vec_lamb_yz(:,i+5)];
%     vec_lamb_xyz_sort =[vec_lamb_xyz_sort vec_lamb_xyz(:,i+2) vec_lamb_xyz(:,i+5)];
%     
    vec_lamb_x_sort =[vec_lamb_x_sort vec_lamb_x(:,i+2)];
    vec_lamb_y_sort =[vec_lamb_y_sort vec_lamb_y(:,i+2)];
    vec_lamb_z_sort =[vec_lamb_z_sort vec_lamb_z(:,i+2)];
    vec_lamb_yz_sort =[vec_lamb_yz_sort vec_lamb_yz(:,i+2)];
    vec_lamb_xyz_sort =[vec_lamb_xyz_sort vec_lamb_xyz(:,i+2)];    
end

vec_lamb_sort = [vec_lamb_x_sort ; vec_lamb_y_sort ; vec_lamb_z_sort ; vec_lamb_yz_sort ; vec_lamb_xyz_sort]';

app_csv = [vec_LLE_sort vec_lamb_sort];