package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"log"
	"os"
)

/*
apt-get install rpmdevtools rpmlint            --- установка инструментов сборки пакетов
rpmdev-setuptree                               --- создание дерева папок для сборки пакета
tar -zvcf <name>.tar.gz <name>                 --- архивирование исходников
mv <name>.tar.gz ~/RPM/SOURCES                 --- перемещение архива с исходниками в папку ресурсы
rpmdev-newspec ~/RPM/SPECS/<name>.spec         --- добавление spec файла
rpmlint ~/RPM/SPECS/<name>.spec                --- проверка валидности spec файла
rpmbuild -v -ba ~/RPM/SPECS/<name>.spec        --- сборка пакета
*/

type config struct {
	Text string `json:"string"`
}

func main() {

	var filename = flag.String("config", "config.json", "")
	flag.Parse()

	data, err := os.ReadFile(*filename)
	if err != nil {
		log.Fatalln(err)
	}

	var config config
	err = json.Unmarshal(data, &config)

	if err != nil {
		log.Fatalln(err)
	}

	fmt.Println(config.Text)

}
