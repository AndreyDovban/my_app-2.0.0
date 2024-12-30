Name:           my_app%{pref}
Version:        2.0.0
Release:        %{rel}

Summary:        A simple app 1
License:        GPLv3
Source:         %name-%version.tar.gz

Group:          System

%description
A simple app

%build
cd my_app


sed -i "s/Root =.*/Root =\"\/usr\/local\/share\/my_app\/\"/g" src/store/root.go
go build -v -o my_app


mkdir -p %buildroot%_usr/local/bin
cp my_app %buildroot%_usr/local/bin/my_app
mkdir -p %buildroot%_usr/local/share
cp -r rpm-resources/share/* %buildroot%_usr/local/share



%files
%_usr/local/bin/my_app
%_usr/local/share/*

# %post
# cd /usr/local/share
# chmod ugo+w my_app
# chmod ugo+w my_app/config




%changelog
* Sun Dec 22 2024 admin
- Release application
