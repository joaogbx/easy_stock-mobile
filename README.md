# Easy Stock Mobile 📱

Sistema de controle de estoque desenvolvido em Flutter com Clean Architecture e padrão BLoC.

## 🚀 Funcionalidades

- **Autenticação** - Login e registro de usuários
- **Gestão de Produtos** - CRUD completo de produtos
- **Controle de Estoque** - Movimentações de entrada e saída
- **Histórico** - Visualização de movimentações por período
- **Perfis de Usuário** - Admin e Funcionário com permissões diferentes
- **Gestão de Empresa** - Cadastro e configuração da empresa

## 🏗️ Arquitetura

```
lib/
├── app/
│   ├── core/           # Configurações globais
│   ├── features/       # Funcionalidades por módulo
│   │   ├── auth/       # Autenticação
│   │   ├── product/    # Produtos
│   │   ├── stock/      # Estoque
│   │   ├── user/       # Usuários
│   │   └── company/    # Empresa
│   └── shared/         # Componentes compartilhados
```

### Padrões Utilizados

- **Clean Architecture** (Data, Domain, Presentation)
- **BLoC/Cubit** para gerenciamento de estado
- **Dependency Injection** com GetIt e Injectable
- **Code Generation** com Freezed

## 🛠️ Tecnologias

| Categoria     | Tecnologia                           |
| ------------- | ------------------------------------ |
| **Framework** | Flutter 3.8.1+                       |
| **Estado**    | flutter_bloc ^9.1.1                  |
| **Navegação** | go_router ^17.0.1                    |
| **HTTP**      | dio ^5.9.0                           |
| **Injeção**   | get_it ^8.2.0, injectable ^2.5.2     |
| **Storage**   | flutter_secure_storage ^9.2.4        |
| **Geração**   | freezed ^3.2.3, build_runner ^2.10.1 |
| **UI**        | shimmer ^3.0.0                       |
| **Config**    | flutter_dotenv ^5.1.0                |

## ⚙️ Configuração

### 1. Clone o repositório

```bash
git clone <repository-url>
cd easy_stock-mobile
```

### 2. Instale as dependências

```bash
flutter pub get
```

### 4. Gere os arquivos de código

```bash
flutter packages pub run build_runner build
```

### 5. Execute o projeto

```bash
flutter run
```

## 🔧 Scripts Úteis

```bash
# Gerar código (Freezed, Injectable)
flutter packages pub run build_runner build --delete-conflicting-outputs

# Limpar e reinstalar dependências
flutter clean && flutter pub get

# Executar em modo release
flutter run --release

# Build para produção
flutter build apk --release
flutter build ios --release
```

## 📱 Funcionalidades por Perfil

### 👤 Funcionário

- Visualizar produtos
- Registrar movimentações de estoque
- Ver histórico próprio

### 👨‍💼 Administrador

- Todas as funcionalidades do funcionário
- Gerenciar produtos (CRUD)
- Gerenciar usuários
- Ver histórico geral
- Filtrar movimentações por data
- Configurar empresa

## 🌐 API

O app consome uma API REST hospedada em:

- **Produção**: `https://easy-stock-apiserver.onrender.com`
- **Desenvolvimento**: `http://localhost:3000`

### Principais Endpoints

- `POST /auth` - Login
- `POST /auth/register` - Registro
- `GET /products` - Listar produtos
- `POST /stock/movements` - Registrar movimentação
- `GET /stock/movements` - Histórico

## 🔒 Segurança

- **Autenticação JWT** armazenada de forma segura
- **Interceptors** para renovação automática de tokens
- **Validação** de formulários
- **Tratamento** de erros de rede

## 👥 Contribuição

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📞 Suporte

Para suporte, entre em contato através do email: joaogabriel.siqueira09@gmail.com

---

