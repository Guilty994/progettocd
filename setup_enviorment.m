'Generating directories...'
dos('create_dataset_directories.bat');

download_links = {
    'http://ds.erc-interfere.eu/downloads/dataset1/3D_cat.zip'
    'http://ds.erc-interfere.eu/downloads/dataset1/3D_multi.zip'
    'http://ds.erc-interfere.eu/downloads/dataset1/3D_venus.zip'
    'http://ds.erc-interfere.eu/downloads/dataset2/CGH_cat8KD.zip'
    'http://ds.erc-interfere.eu/downloads/dataset2/CGH_venus8KD.zip'
};
zip_names = {
    '3D_cat'
    '3D_multi'
    '3D_venus'
    'CGH_cat8KD'
    'CGH_venus8KD'
};

dir_paths = {
    './dataset/Interfere1/3D_Cat/'
    './dataset/Interfere1/3D_Multi/'
    './dataset/Interfere1/3D_Venus/'
    './dataset/Interfere2/cat8KD/'
    './dataset/Interfere2/venus8KD/'
};


for i=1:length(download_links)
    
    download = strcat('cd', {' '}, dir_paths{i} ,{' '},'&& curl', {' '}, download_links{i},{' '} ,'--output', {' '}, zip_names(i),'.zip')
    dos(download{1});
    
    extract_file = strcat('cd', {' '}, dir_paths{i} ,{' '},'&& tar -xf', {' '},zip_names{i},'.zip')
    dos(extract_file{1});

end




