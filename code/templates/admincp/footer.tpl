<div class="footdesign">Copyright &copy; Pennyauction Version 1.2. All Rights Reserved.</div>

<!-- jQuery -->

<!--  <script src="{$config.dpath}js/jquery.js"></script>-->
<script src="{$config['url']}/bower_components/jquery/dist/jquery.js"></script>
{foreach $external2js as $key => $val}
<script src="{$config['externaljs']}{$val}.js" type="text/javascript"></script>
{/foreach}

<!-- Bootstrap Core JavaScript -->
<script type="text/javascript" language="javascript"
        src="{$config['url']}/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="{$config.dpath}js/common.js"></script>
</body>
</html>
