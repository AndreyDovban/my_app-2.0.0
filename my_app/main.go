package main

import (
	"my_app/src/static"
	"my_app/src/store"

	"fyne.io/fyne/v2"
	"fyne.io/fyne/v2/app"
	"fyne.io/fyne/v2/widget"

	"encoding/json"
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

	data, err := os.ReadFile(store.Root + "config/config.json")
	if err != nil {
		log.Fatalln(err)
	}

	var config config
	err = json.Unmarshal(data, &config)

	if err != nil {
		log.Fatalln(err)
	}

	fmt.Println(config.Text)

	a := app.New()
	w := a.NewWindow(config.Text)
	w.SetIcon(static.ResV1Png)

	w.SetContent(widget.NewLabel(config.Text))

	w.CenterOnScreen()
	w.Resize(fyne.NewSize(600, 400))
	w.Show()

	a.Run()

}
