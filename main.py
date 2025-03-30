import sys
from PySide6.QtWidgets import (QApplication, QMainWindow)


class Example(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Hello World")
        self.setGeometry(50, 50, 400, 300)


if __name__ == "__main__":
    app = QApplication(sys.argv)
    mainwindow = Example()
    mainwindow.show()
    sys.exit(app.exec())
