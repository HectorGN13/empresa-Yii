<?php
use yii\helpers\Html;
?>

<p>You have entered the following informarion: </p>

<ul>
    <li><label>Nombre</label>: <?= Html::encode($model->usuario) ?></li>
    <li><label>Email</label>: <?= Html::encode($model->email) ?></li>
    <li><label>Contraseña</label>: <?= Html::encode($model->contraseña) ?></li>
</ul>