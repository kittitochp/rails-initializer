# Build Rails Initializer Docker Image 
```docker build -t rails-initializer .```

# Initialize Rails Project 
```docker run --rm -v $(pwd):/app -e LOCAL_UID=$(id -u) -e LOCAL_GID=$(id -g) rails-initializer rails new your_project_name```

# Initialize Rails API Only project
```docker run --rm -v $(pwd):/app -e LOCAL_UID=$(id -u) -e LOCAL_GID=$(id -g) rails-initializer rails new your_project_name --api --database=postgresql```
