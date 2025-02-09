# 🏨 Motel List Test

Este é um projeto Flutter desenvolvido para listar motéis e exibir detalhes sobre eles. O projeto utiliza **Flutter Bloc** para gerenciamento de estado, **GetIt** para injeção de dependências e **GoRouter** para navegação.

## 📌 Pré-requisitos

Antes de configurar o projeto, certifique-se de ter os seguintes requisitos:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) instalado (versão compatível com `sdk: ^3.6.2`)
- [Dart](https://dart.dev/get-dart) instalado
- [FVM](https://fvm.app/) (opcional, mas recomendado para gerenciar versões do Flutter)
- Um editor de código como [VS Code](https://code.visualstudio.com/) ou [Android Studio](https://developer.android.com/studio)
- Emulador ou dispositivo físico para rodar o app

---

## 🚀 Configuração do Projeto

### 1️⃣ Clone o repositório

```sh
git clone https://github.com/seu-usuario/seu-repositorio.git
cd seu-repositorio
```

### 2️⃣ Instale as dependências do projeto

```sh
flutter pub get
```

### 3️⃣ Configure os dispositivos

- Para rodar no emulador Android:

  ```sh
  flutter emulators --launch <nome-do-emulador>
  flutter run
  ```

- Para rodar no iOS:
  ```sh
  open -a Simulator
  flutter run
  ```

---

## 📦 Dependências Utilizadas

O projeto utiliza as seguintes dependências:

### 📌 Dependências principais:

| Pacote         | Versão    | Descrição                                 |
| -------------- | --------- | ----------------------------------------- |
| `flutter_bloc` | `^9.0.0`  | Gerenciamento de estado com Bloc          |
| `get_it`       | `^8.0.3`  | Injeção de dependências                   |
| `go_router`    | `^14.8.0` | Navegação declarativa no Flutter          |
| `http`         | `^1.3.0`  | Comunicação com APIs HTTP                 |
| `equatable`    | `^2.0.7`  | Comparação simplificada de objetos        |
| `dartz`        | `^0.10.1` | Programação funcional no Dart             |
| `intl`         | `^0.20.2` | Internacionalização e formatação de datas |
| `photo_view`   | `^0.15.0` | Visualização de imagens com zoom e pan    |

### 🛠 Dependências de desenvolvimento (para testes):

| Pacote          | Versão         | Descrição                     |
| --------------- | -------------- | ----------------------------- |
| `flutter_test`  | `sdk: flutter` | Testes de widgets e unitários |
| `flutter_lints` | `^5.0.0`       | Padrões de lint recomendados  |
| `bloc_test`     | `^10.0.0`      | Testes para Bloc e Cubit      |
| `mocktail`      | `^1.0.4`       | Mocking para testes unitários |

---

## 🛠 Estrutura do Projeto

A estrutura do projeto segue a Clean Architecture com separação de responsabilidades:

```
lib/
│── core/               # Camada de domínio e serviços essenciais
│── data/               # Camada de dados (repositórios e models)
│── domain/             # Camada de domínio (entidades e use cases)
│── presenter/          # Camada de apresentação (UI e Cubits)
│── main.dart           # Ponto de entrada do aplicativo
```

---

## 🔍 Testes

Para rodar os testes, execute:

```sh
flutter test
```

---

## 🛠 Possíveis Problemas

Caso tenha algum problema ao rodar o projeto, tente:

1. **Limpar o cache do Flutter**
   ```sh
   flutter clean
   ```
2. **Reinstalar dependências**
   ```sh
   flutter pub get
   ```
3. **Rodar novamente o projeto**
   ```sh
   flutter run
   ```

Se o problema persistir, consulte os logs de erro ou verifique a configuração do **GetIt**, pois ele é essencial para a injeção de dependências.

---

## 📞 Contato

Se precisar de mais informações ou quiser contribuir com o projeto, entre em contato:

📱 **WhatsApp:** [Fale comigo](https://wa.me/5548996107270)  
📧 **E-mail:** [johnathanrocha@gmail.com](mailto:johnathanrocha@gmail.com)
