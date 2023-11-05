/*
  Warnings:

  - You are about to drop the `artesania` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `artesania`;

-- CreateTable
CREATE TABLE `Accesorios` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(191) NOT NULL,
    `descripcion` VARCHAR(191) NOT NULL,
    `precio` DOUBLE NOT NULL,
    `imagen` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
