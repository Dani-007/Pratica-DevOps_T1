<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Docker | Programador a Bordo</title>
  <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css" />
</head>
<body>
  <?php
    // Pega a busca se houver
    $search = isset($_GET['search']) ? trim($_GET['search']) : '';

    // Busca os produtos da API Node.js
    $result = file_get_contents("http://node-container:9001/products");
    $products = json_decode($result);

    // Se houver busca, filtra os produtos
    if ($search !== '') {
      $products = array_filter($products, function($product) use ($search) {
        return stripos($product->name, $search) !== false;
      });
    }
  ?>

  <div class="container mt-4">
    <h1 class="mb-4">Lista de Produtos</h1>

    <form method="GET" class="mb-3">
      <div class="input-group">
        <input type="text" name="search" class="form-control" placeholder="Buscar produto..." value="<?php echo htmlspecialchars($search); ?>">
        <button type="submit" class="btn btn-primary">Buscar</button>
      </div>
    </form>

    <table class="table table-striped">
      <thead>
        <tr>
          <th>Produto</th>
          <th>Preço</th>
        </tr>
      </thead>
      <tbody>
        <?php if (empty($products)): ?>
          <tr>
            <td colspan="2">Nenhum produto encontrado.</td>
          </tr>
        <?php else: ?>
          <?php foreach($products as $product): ?>
            <tr>
              <td><?php echo htmlspecialchars($product->name); ?></td>
              <td><?php echo htmlspecialchars($product->price); ?></td>
            </tr>
          <?php endforeach; ?>
        <?php endif; ?>
      </tbody>
    </table>
  </div>
</body>
</html>
