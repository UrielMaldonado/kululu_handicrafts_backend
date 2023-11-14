-- CreateTable
CREATE TABLE "Usuario" (
    "id" SERIAL NOT NULL,
    "nombre_usuario" TEXT NOT NULL,
    "correo_electronico" TEXT NOT NULL,
    "contrasena" TEXT NOT NULL,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Compra" (
    "id" SERIAL NOT NULL,
    "id_usuario" INTEGER NOT NULL,

    CONSTRAINT "Compra_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ElementoCarrito" (
    "id" SERIAL NOT NULL,
    "id_carrito" INTEGER NOT NULL,
    "id_producto" INTEGER NOT NULL,
    "cantidad" INTEGER NOT NULL,

    CONSTRAINT "ElementoCarrito_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Producto" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "descripcion" TEXT NOT NULL,
    "precio" DOUBLE PRECISION NOT NULL,
    "imagen" TEXT NOT NULL,

    CONSTRAINT "Producto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Inventario" (
    "id" SERIAL NOT NULL,
    "cantidad" INTEGER NOT NULL,
    "fecha" TIMESTAMP(3) NOT NULL,
    "id_producto" INTEGER NOT NULL,

    CONSTRAINT "Inventario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RopaArtesanal" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "descripcion" TEXT NOT NULL,
    "precio" DOUBLE PRECISION NOT NULL,
    "imagen" VARCHAR(1000) NOT NULL,

    CONSTRAINT "RopaArtesanal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AccesorioArtesanal" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "descripcion" TEXT NOT NULL,
    "precio" DOUBLE PRECISION NOT NULL,
    "imagen" TEXT NOT NULL,

    CONSTRAINT "AccesorioArtesanal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JoyeriaArtesanal" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "descripcion" TEXT NOT NULL,
    "precio" DOUBLE PRECISION NOT NULL,
    "imagen" TEXT NOT NULL,

    CONSTRAINT "JoyeriaArtesanal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_InventarioToRopaArtesanal" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_InventarioToJoyeriaArtesanal" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_AccesorioArtesanalToInventario" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_correo_electronico_key" ON "Usuario"("correo_electronico");

-- CreateIndex
CREATE UNIQUE INDEX "_InventarioToRopaArtesanal_AB_unique" ON "_InventarioToRopaArtesanal"("A", "B");

-- CreateIndex
CREATE INDEX "_InventarioToRopaArtesanal_B_index" ON "_InventarioToRopaArtesanal"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_InventarioToJoyeriaArtesanal_AB_unique" ON "_InventarioToJoyeriaArtesanal"("A", "B");

-- CreateIndex
CREATE INDEX "_InventarioToJoyeriaArtesanal_B_index" ON "_InventarioToJoyeriaArtesanal"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_AccesorioArtesanalToInventario_AB_unique" ON "_AccesorioArtesanalToInventario"("A", "B");

-- CreateIndex
CREATE INDEX "_AccesorioArtesanalToInventario_B_index" ON "_AccesorioArtesanalToInventario"("B");

-- AddForeignKey
ALTER TABLE "Compra" ADD CONSTRAINT "Compra_id_usuario_fkey" FOREIGN KEY ("id_usuario") REFERENCES "Usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ElementoCarrito" ADD CONSTRAINT "ElementoCarrito_id_carrito_fkey" FOREIGN KEY ("id_carrito") REFERENCES "Compra"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ElementoCarrito" ADD CONSTRAINT "ElementoCarrito_id_producto_fkey" FOREIGN KEY ("id_producto") REFERENCES "Producto"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Inventario" ADD CONSTRAINT "Inventario_id_producto_fkey" FOREIGN KEY ("id_producto") REFERENCES "Producto"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_InventarioToRopaArtesanal" ADD CONSTRAINT "_InventarioToRopaArtesanal_A_fkey" FOREIGN KEY ("A") REFERENCES "Inventario"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_InventarioToRopaArtesanal" ADD CONSTRAINT "_InventarioToRopaArtesanal_B_fkey" FOREIGN KEY ("B") REFERENCES "RopaArtesanal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_InventarioToJoyeriaArtesanal" ADD CONSTRAINT "_InventarioToJoyeriaArtesanal_A_fkey" FOREIGN KEY ("A") REFERENCES "Inventario"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_InventarioToJoyeriaArtesanal" ADD CONSTRAINT "_InventarioToJoyeriaArtesanal_B_fkey" FOREIGN KEY ("B") REFERENCES "JoyeriaArtesanal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AccesorioArtesanalToInventario" ADD CONSTRAINT "_AccesorioArtesanalToInventario_A_fkey" FOREIGN KEY ("A") REFERENCES "AccesorioArtesanal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AccesorioArtesanalToInventario" ADD CONSTRAINT "_AccesorioArtesanalToInventario_B_fkey" FOREIGN KEY ("B") REFERENCES "Inventario"("id") ON DELETE CASCADE ON UPDATE CASCADE;
